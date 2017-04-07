defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @actions [
    "wink",
    "double blink",
    "close your eyes",
    "jump",
  ]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    bits = code
      |> Integer.digits(2)
      |> Enum.reverse

    handshake = bits
      |> Enum.zip(@actions)
      |> Enum.filter(fn(x) -> elem(x, 0) == 1 end)
      |> Enum.reduce([], fn(x, acc) -> acc ++ [elem(x, 1)] end)

    if Enum.at(bits, 4) do
      Enum.reverse(handshake)
    else
      handshake
    end
  end
end
