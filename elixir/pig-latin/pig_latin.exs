defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """

  @vowels ["a", "e", "i", "o", "u"]
  @specials ["x", "y"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
      |> String.split
      |> Enum.map(&String.graphemes/1)
      |> Enum.map(&do_translate(&1, []))
      |> Enum.join(" ")
  end

  defp do_translate(word=[first, second | _], acc)
    when first in @vowels or (first in @specials and second not in @vowels), do:
      "#{word}#{acc}ay"

  defp do_translate(["q", "u" | rest], acc), do:
    do_translate(rest, acc ++ ["qu"])

  defp do_translate([consonant | rest], acc), do:
    do_translate(rest, acc ++ [consonant])
end
