defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a_1, b_1}, {a_2, b_2}) do
    {a_1 * b_2 + a_2 * b_1, b_1 * b_2}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a_1, b_1}, {a_2, b_2}), do: reduce({a_1 * b_2 - a_2 * b_1, b_1 * b_2})

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a_1, b_1}, {a_2, b_2}), do: reduce({a_1 * a_2, b_1 * b_2})

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a_1, b_1}, {a_2, b_2}), do: reduce({a_1 * b_2, a_2 * b_1})

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({nom, denom}), do: {Kernel.abs(nom), Kernel.abs(denom)}

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({nom, denom}, n), do: {:math.pow(nom, Kernel.abs(n)), :math.pow(denom, Kernel.abs(n))}

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {nom, denom}) do
    :math.pow(:math.pow(x, nom), 1/denom)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) when b < 0, do: reduce({a * -1, b * -1})
  def reduce({a, b} = rational) do
    gcd = gcd(RationalNumbers.abs(rational))
    {trunc(a / gcd), trunc(b / gcd)}
  end

  defp gcd({a, 0}), do: a
  defp gcd({0, b}), do: b
  defp gcd({a, b}) when a == b, do: a
  defp gcd({a, b}) when a > b, do: gcd({b, rem(a,b)})
  defp gcd({a, b}) when a < b, do: gcd({a, rem(b,a)})
end
