defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> normalize
    |> count_words
  end

  defp normalize(s) do
    s
    |> String.replace("_", " ")
    |> String.replace(~r/[!&@\$%\^&:,]/, "")
    |> String.downcase 
    |> String.split 
  end
  
  defp count_words(s) do
    Enum.reduce(s, %{}, &add_word/2)
  end

  defp add_word(word, counter) do
    Map.update(counter, word, 1, &(&1 + 1))
  end

end
