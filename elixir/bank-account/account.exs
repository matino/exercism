defmodule BankAccount do
  use GenServer

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  GenServer.init/1 callback
  """
  def init(:ok) do
    {:ok, 0}
  end

  @doc """
  GenServer.handle_call/3 callback
  """
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:update, amount}, _from, state) do
    {:reply, state + amount, state + amount}
  end


  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    GenServer.start_link(BankAccount, :ok, [])
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    GenServer.stop(account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    if Process.alive?(account) do
      GenServer.call(account, :get)
    else
      {:error, :account_closed}
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    if Process.alive?(account) do
      GenServer.call(account, {:update, amount})
    else
      {:error, :account_closed}
    end
  end
end
