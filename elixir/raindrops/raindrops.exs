defmodule Raindrops do

  @raindrop %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong",
  }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(num) do
    ""
      |> contains?(num, 3)
      |> contains?(num, 5)
      |> contains?(num, 7)
      |> contained?(num)
  end

  defp contains?(acc, num, factor) do
    cond do
      rem(num, factor) == 0 -> acc <> @raindrop[factor]
      true -> acc
    end
  end

  defp contained?(acc, num) do
    cond do
      acc == "" -> "#{num}"
      true -> acc
    end
  end

end
