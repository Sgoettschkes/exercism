defmodule NameBadge do
  def print(id, name, department) do
    first_part =
      if id == nil do
        ""
      else
        "[#{id}] - "
      end

    last_part =
      if department == nil do
        "OWNER"
      else
        String.upcase(department)
      end

    "#{first_part}#{name} - #{last_part}"
  end
end
