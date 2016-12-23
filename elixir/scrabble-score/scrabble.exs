defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
      |> String.downcase
      |> String.codepoints
      |> Enum.reduce(0, fn(ch, acc) -> acc + points(ch) end)
  end

  defp points(ch) do
    cond do
      ch in ["a","e","i","o","u","l","n","r","s","t"] -> 1
      ch in ["d","g"] -> 2
      ch in ["b","c","m","p"] -> 3
      ch in ["f","h","v","w","y"] -> 4
      ch in ["k"] -> 5
      ch in ["j","x"] -> 8
      ch in ["q","z"] -> 10
      true -> 0
    end
  end
end
