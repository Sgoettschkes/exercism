defmodule LogParser do
  @log_levels ["DEBUG", "INFO", "WARNING", "ERROR"]

  def valid_line?(line) do
    case Regex.run(~r/^\[(.+)\]/, line) do
      [_, log_level] -> Enum.member?(@log_levels, log_level)
      _ -> false
    end
  end

  def split_line(line) do
    String.split(line, ~r/\<[\~|\*|\=|\-]*\>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end\-of\-line\d+/i, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User\s+(\S+)\s*/mui, line) do
      [_, user] -> "[USER] " <> user <> " " <> line
      nil -> line
    end
  end
end
