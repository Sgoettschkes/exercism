defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    {:ok, operation.(stack)}
  rescue
    _ -> :error
  end

  def calculate_verbose(stack, operation) do
    {:ok, operation.(stack)}
  rescue
    err -> {:error, err.message}
  end
end
