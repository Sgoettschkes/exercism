defmodule BasketballWebsite do
  def extract_from_path(nil, _path), do: nil
  def extract_from_path(data, nil), do: data

  def extract_from_path(data, [path]) do
    data[path]
  end

  def extract_from_path(data, path) when is_binary(path) do
    case String.split(path, ".") do
      [first] -> data[first]
      [first | rest] -> extract_from_path(data[first], rest)
    end
  end

  def extract_from_path(data, [first | rest]) do
    extract_from_path(data[first], rest)
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
