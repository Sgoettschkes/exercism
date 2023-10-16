defmodule TopSecret do
  def to_ast(string) do
    {:ok, quoted} = Code.string_to_quoted(string)
    quoted
  end

  def decode_secret_message_part(ast, acc) do
    acc =
      case ast do
        {root, _,
         [
           {:when, _,
            [
              {function_name, _, function_arguments},
              _
            ]},
           _
         ]}
        when root == :def or root == :defp ->
          accumulate(acc, function_name, function_arguments)

        {root, _,
         [
           {function_name, _, function_arguments},
           _
         ]}
        when root == :def or root == :defp ->
          accumulate(acc, function_name, function_arguments)

        _ ->
          acc
      end

    {ast, acc}
  end

  def decode_secret_message(string) do
    case to_ast(string) do
      {:__block__, _, _} = funs ->
        decode_funs(funs)

      {:defmodule, _,
       [
         _,
         [
           do: funs
         ]
       ]} ->
        decode_funs(funs)
    end
  end

  defp accumulate(acc, function_name, function_arguments) do
    {first_part, _second_part} =
      function_name
      |> Atom.to_string()
      |> String.split_at(length(function_arguments || []))

    [first_part | acc]
  end

  defp decode_funs({:__block__, _, funs}) do
    funs
    |> Enum.reduce([], fn
      {:defmodule, _, [_, [do: funs]]}, acc ->
        [decode_funs(funs) | acc]

      {_def, _, _fun} = ast, acc ->
        {_ast, acc} = decode_secret_message_part(ast, acc)
        acc
    end)
    |> Enum.reverse()
    |> Enum.join()
  end

  defp decode_funs(ast) do
    {_ast, acc} = decode_secret_message_part(ast, [])
    Enum.join(acc)
  end
end
