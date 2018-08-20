defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @mapping %{
    ?A => ?U,
    ?C => ?G,
    ?T => ?A,
    ?G => ?C,
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn char -> @mapping[char] end)
  end
end
