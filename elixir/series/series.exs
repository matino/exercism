defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """

  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    s
      |> String.to_charlist
      |> slice(size)
      |> Enum.map(&List.to_string/1)
  end

  defp slice(s, size) when size <= 0 or size > length(s), do: []
  defp slice([h | t] = s, size) do
    [Enum.slice(s, 0, size) | slice(t, size)]
  end
end