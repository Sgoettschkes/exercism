defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace("-", " ")
    |> String.replace(~r/[^a-zA-Z0-9\s]/, "")
    |> String.split(" ")
    |> Enum.map_join(&String.first/1)
    |> String.upcase()
  end
end
