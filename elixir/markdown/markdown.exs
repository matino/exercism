defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("# Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(text) do
    text
      |> String.split("\n")
      |> Enum.map_join(&process_line/1)
      |> replace_underscores()
      |> patch_list()
  end

  def process_line("#" <> _ = line), do: process_header(line)
  def process_line("*" <> _ = line), do: process_list(line)
  def process_line(line), do: process_paragraph(line)

  defp process_header(line) do
    [hashes | text] = String.split(line, " ", parts: 2)
    text
      |> tag("h#{String.length(hashes)}")
  end

  defp process_list(line) do
    line
      |> String.trim_leading("* ")
      |> tag("li")
  end

  defp process_paragraph(line) do
    line
      |> tag("p")
  end

  defp tag(content, tag) do
    "<#{tag}>#{content}</#{tag}>"
  end

  defp replace_underscores(line) do
    line
      |> String.replace(~r/__(.*?)__/, "<strong>\\1</strong>")
      |> String.replace(~r/_(.*?)_/, "<em>\\1</em>")
  end

  defp patch_list(text) do
    text
      |> String.replace(~r/<li>.*<\/li>/, "<ul>\\0</ul>", global: true)
  end

end
