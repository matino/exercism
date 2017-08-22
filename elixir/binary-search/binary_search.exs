defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    binary_search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp binary_search(_, _, start, end_) when end_ - start < 0, do: :not_found

  defp binary_search(numbers, key, start, end_) do
    middle = div(start + end_, 2)
    value = elem(numbers, middle)
    cond do
      value == key -> {:ok, middle}
      value > key -> binary_search(numbers, key, start, middle - 1)
      value < key -> binary_search(numbers, key, middle + 1, end_)
    end
  end

end
