defmodule RotationalCipher do

  @alphabet_lower ?a..?z |> Enum.to_list
  @alphabet_upper ?A..?Z |> Enum.to_list

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> String.to_charlist
      |> Enum.map(&(shift_character(&1, shift)))
      |> List.to_string
  end

  defp shift_character(ch, shift) when ch in @alphabet_lower do
    rem(ch - ?a + shift, 26) + ?a
  end

  defp shift_character(ch, shift) when ch in @alphabet_upper do
    rem(ch - ?A + shift, 26) + ?A
  end

  defp shift_character(ch, _), do: ch

end
