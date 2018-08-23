defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(num) do
    """
    #{count(num)} of beer on the wall, #{count(num)} of beer.
    #{take(num)} down and pass it around, #{count(num-1)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range
      |> Enum.map(&verse/1)
      |> Enum.join("\n")
  end

  defp count(0), do: "no more bottles"
  defp count(1), do: "1 bottle"
  defp count(num), do: "#{num} bottles"

  defp take(1), do: "Take it"
  defp take(_), do: "Take one"
end
