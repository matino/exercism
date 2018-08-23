defmodule TwelveDays do

  @ord %{
    0 => "first",
    1 => "second",
    2 => "third",
    3 => "fourth",
    4 => "fifth",
    5 => "sixth",
    6 => "seventh",
    7 => "eighth",
    8 => "ninth",
    9 => "tenth",
    10 => "eleventh",
    11 => "twelfth",
  }

  @gifts {
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  }

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(num) do
    "On the #{@ord[num-1]} day of Christmas my true love gave to me, #{gifts(num-1)}."
  end

  defp gifts(0), do: elem(@gifts, 0)
  defp gifts(num) do
    "#{
      num..1
        |> Enum.map(&gift/1)
        |> Enum.join(", ")
    }, and #{gift(0)}"
  end

  defp gift(num), do: elem(@gifts, num)

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Range.new(starting_verse, ending_verse)
      |> Enum.map(&verse(&1))
      |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end

end
