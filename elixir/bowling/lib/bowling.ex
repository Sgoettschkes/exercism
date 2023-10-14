defmodule Bowling do
  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  defmodule Frame do
    defstruct(
      roll_one: nil,
      roll_two: nil,
      fill_ball_one: nil,
      fill_ball_two: nil,
      strike: false,
      spare: false,
      finished: false
    )
  end

  defmodule PinCountExceeded do
    defexception message: "Pin count exceeds pins on the lane"
  end

  defmodule GameOver do
    defexception message: "Cannot roll after game is over"
  end

  @spec start() :: any
  def start do
    {:ok, agent_pid} = Agent.start(fn -> [] end)
    agent_pid
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful error tuple.
  """

  @spec roll(any, integer) :: {:ok, any} | {:error, String.t()}
  def roll(_game, roll) when roll < 0, do: {:error, "Negative roll is invalid"}
  def roll(_game, roll) when roll > 10, do: {:error, "Pin count exceeds pins on the lane"}

  def roll(game, roll) do
    Agent.update(game, fn
      [] ->
        [new_frame(roll)]

      frames when length(frames) <= 9 ->
        case List.last(frames) do
          %Frame{finished: true} ->
            frames
            |> Kernel.++([new_frame(roll)])
            # Update strike or spare in last frame
            |> List.update_at(-2, fn
              %Frame{roll_one: roll_one, strike: true} = frame ->
                %Frame{frame | roll_one: roll_one + roll}

              %Frame{roll_two: roll_two, spare: true} = frame ->
                %Frame{frame | roll_two: roll_two + roll}

              frame ->
                frame
            end)
            |> update_strike_2_frames_before(roll)

          _ ->
            frames
            |> List.update_at(-1, fn
              %Frame{roll_one: roll_one} when roll_one + roll > 10 ->
                raise Bowling.PinCountExceeded

              %Frame{roll_one: roll_one} = frame ->
                %Frame{frame | roll_two: roll, spare: roll_one + roll == 10, finished: true}
            end)
            # Update strike in last frame
            |> List.update_at(-2, fn
              %Frame{roll_one: roll_one, strike: true} = frame ->
                %Frame{frame | roll_one: roll_one + roll}

              frame ->
                frame
            end)
        end

      frames when length(frames) == 10 ->
        List.update_at(frames, -1, fn
          %Frame{strike: true, fill_ball_one: nil} = frame ->
            %Frame{frame | fill_ball_one: roll}

          %Frame{strike: true, fill_ball_one: fill_ball_one}
          when fill_ball_one != 10 and fill_ball_one + roll > 10 ->
            raise Bowling.PinCountExceeded

          %Frame{strike: true, fill_ball_two: fill_ball_two} when is_integer(fill_ball_two) ->
            raise Bowling.GameOver

          %Frame{strike: true} = frame ->
            %Frame{frame | fill_ball_two: roll, finished: true}

          %Frame{spare: true, fill_ball_one: fill_ball_one} when is_integer(fill_ball_one) ->
            raise Bowling.GameOver

          %Frame{spare: true} = frame ->
            %Frame{frame | fill_ball_one: roll, finished: true}

          %Frame{strike: false, roll_one: roll_one, roll_two: nil} = frame ->
            %Frame{
              frame
              | roll_two: roll,
                spare: roll_one + roll == 10,
                finished: roll_one + roll != 10
            }

          _ ->
            raise Bowling.GameOver
        end)
        |> update_strike_9th_frame(roll)

      _frames ->
        raise Bowling.GameOver
    end)

    {:ok, game}
  catch
    :exit, {{%{message: message}, _}, _} ->
      {:error, message}
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful error tuple.
  """

  @spec score(any) :: {:ok, integer} | {:error, String.t()}
  def score(game) do
    game
    |> Agent.get(&score_frames/1)
  end

  defp new_frame(roll),
    do: %Bowling.Frame{roll_one: roll, strike: roll == 10, finished: roll == 10}

  defp update_strike_2_frames_before(frames, roll) do
    case Enum.at(frames, -2) do
      %Frame{strike: true} ->
        List.update_at(frames, -3, fn
          %Frame{roll_one: roll_one, strike: true} = frame ->
            %Frame{frame | roll_one: roll_one + roll}

          frame ->
            frame
        end)

      _ ->
        frames
    end
  end

  defp update_strike_9th_frame(frames, roll) do
    case List.last(frames) do
      %Frame{fill_ball_one: fill_ball_one, fill_ball_two: nil} when is_integer(fill_ball_one) ->
        List.update_at(frames, -2, fn
          %Frame{roll_one: roll_one, strike: true} = frame ->
            %Frame{frame | roll_one: roll_one + roll}

          frame ->
            frame
        end)

      _ ->
        frames
    end
  end

  defp score_frames(frames) when length(frames) == 10 do
    case List.last(frames) do
      %{strike: true, fill_ball_one: nil} ->
        {:error, "Score cannot be taken until the end of the game"}

      %{strike: true, fill_ball_two: nil} ->
        {:error, "Score cannot be taken until the end of the game"}

      %{spare: true, fill_ball_one: nil} ->
        {:error, "Score cannot be taken until the end of the game"}

      _ ->
        score =
          frames
          |> Enum.map(fn %Frame{
                           roll_one: roll_one,
                           roll_two: roll_two,
                           fill_ball_one: fill_ball_one,
                           fill_ball_two: fill_ball_two
                         } ->
            [roll_one, roll_two, fill_ball_one, fill_ball_two]
          end)
          |> List.flatten()
          |> Enum.reject(&is_nil/1)
          |> Enum.sum()

        {:ok, score}
    end
  end

  defp score_frames(_frames), do: {:error, "Score cannot be taken until the end of the game"}
end
