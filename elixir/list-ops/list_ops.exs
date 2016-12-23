defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(list), do: __reverse(list, [])
  defp __reverse([], acc), do: acc
  defp __reverse([head | tail], acc), do: __reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head | tail], fun), do: [fun.(head) | map(tail, fun)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, fun), do: reduce(tail, fun.(head, acc), fun)

  @spec append(list, list) :: list
  def append([], []), do: []
  def append(a, []), do: a
  def append([], b), do: b
  def append([h|t], b), do: [h | append(t, b)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head | tail]), do: append(head, concat(tail))

end
