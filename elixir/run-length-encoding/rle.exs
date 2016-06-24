defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(s) do
    encode_string(s)
  end

  defp encode_string("") do
    ""
  end
  
  defp encode_string(<<first::utf8, rest::binary>>) do
    count_occurence(rest, first, 1, "")
  end

  defp count_occurence(<<first::utf8, rest::binary>>, first, count, acc) do
    count_occurence(rest, first, count + 1, acc)
  end

  defp count_occurence(<<first::utf8, rest::binary>>, char, count, acc) do
    count_occurence(rest, first, 1, acc <> to_string(count) <> <<char::utf8>>)
  end

  defp count_occurence("", last, count, acc) do
    acc <> to_string(count) <> <<last::utf8>>
  end

  @spec decode(String.t) :: String.t
  def decode(s) do
    Regex.replace(~r/(\d+)(\p{L})/u, s, &replace/3)
  end
  
  defp replace(_, n, ch) do
    num = String.to_integer(n)
    String.duplicate(ch, num)
  end
end
