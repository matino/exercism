defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.string) :: String.t()
  def abbreviate(string) do
    string
    |> String.split
    |> Enum.map(&capitalize/1)
    |> Enum.reduce("", fn(word, acc) -> acc <> filter_upcase(word) end)
  end

  defp capitalize(<<first::utf8, rest::binary>>) do
    String.upcase(<<first::utf8>>) <> rest
  end

  defp filter_upcase(word) do
    word
    |> String.graphemes
    |> Enum.filter(&upcase_letter?/1)
    |> Enum.join("")
  end

  defp upcase_letter?(char) do
    String.upcase(char) == char and String.match?(char, ~r/\p{L}/u)
  end

end
