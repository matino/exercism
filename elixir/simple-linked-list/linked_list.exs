defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: {}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem), do: Tuple.insert_at(list, 0, elem)

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list), do: tuple_size(list)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list), do: LinkedList.length(list) == 0

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:error, :empty_list}
  def peek({}), do: {:error, :empty_list}

  @spec peek(t) :: {:ok, any()}
  def peek(list), do: {:ok, elem(list, 0)}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:error, :empty_list}
  def tail({}), do: {:error, :empty_list}

  @spec tail(t) :: {:ok, t}
  def tail(list), do: {:ok, Tuple.delete_at(list, 0)}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:error, :empty_list}
  def pop({}), do: {:error, :empty_list}

  @spec pop(t) :: {:ok, any(), t}
  def pop(list), do: {:ok, elem(list, 0), Tuple.delete_at(list, 0)}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list), do: List.to_tuple(list)

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list), do: Tuple.to_list(list)

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse({}), do: {}

  @spec reverse(t) :: t
  def reverse(list) do
    {:ok, elem, list} = pop(list)
    Tuple.append(reverse(list), elem)
  end
end
