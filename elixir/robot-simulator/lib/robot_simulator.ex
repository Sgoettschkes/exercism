defmodule RobotSimulator do
  @type robot() :: {position(), direction()}
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  @directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      not valid_position?(position) -> {:error, "invalid position"}
      not valid_direction?(direction) -> {:error, "invalid direction"}
      true -> {position, direction}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, instructions) do
    instructions
    |> String.codepoints()
    |> Enum.reduce(robot, fn instruction, robot ->
      move(robot, instruction)
    end)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction({_position, direction}) do
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position({position, _direction}) do
    position
  end

  defp valid_position?({x, y}) when is_integer(x) and is_integer(y), do: true
  defp valid_position?(_), do: false

  defp valid_direction?(direction) do
    Enum.member?(@directions, direction)
  end

  defp move({:error, _msg} = err, _) do
    err
  end

  defp move({position, direction}, "R") do
    case Enum.find_index(@directions, fn d -> d == direction end) do
      3 -> {position, Enum.at(@directions, 0)}
      i -> {position, Enum.at(@directions, i + 1)}
    end
  end

  defp move({position, direction}, "L") do
    case Enum.find_index(@directions, fn d -> d == direction end) do
      0 -> {position, Enum.at(@directions, 3)}
      i -> {position, Enum.at(@directions, i - 1)}
    end
  end

  defp move({{x, y}, :north}, "A") do
    {{x, y + 1}, :north}
  end

  defp move({{x, y}, :east}, "A") do
    {{x + 1, y}, :east}
  end

  defp move({{x, y}, :south}, "A") do
    {{x, y - 1}, :south}
  end

  defp move({{x, y}, :west}, "A") do
    {{x - 1, y}, :west}
  end

  defp move(_, _) do
    {:error, "invalid instruction"}
  end
end
