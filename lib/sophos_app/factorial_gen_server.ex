defmodule SophosApp.FactorialGenServer do
  use GenServer

  alias SophosApp.Factorial

  def init(_args) do
    {:ok, %{}}
  end

  def start_link(_args) do
    GenServer.start_link( __MODULE__, %{})
  end

  def compute(pid, n) do
    GenServer.cast(pid, {:of, n})
  end

  def crash(pid) do
    GenServer.call(pid, :crash)
  end

  @spec status(any) :: any
  def status(pid) do
    IO.inspect(pid)
    GenServer.call(pid, :status)
  end

  def handle_info(msg, state) do
    IO.inspect(msg)
    {:noreply, state}
  end

  def handle_call(:crash, _from, state) do
    Process.exit(self(), :kill)
    {:reply, 0, state}
  end

  def handle_call({:of,n}, _from, state) do
    result = compute_of(n, state)
    new_state = Map.put_new(state, n, result)
    {:reply, new_state}
  end

  def handle_call(:status, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:of,n}, state) do
    result = compute_of(n, state)
    new_state = Map.put_new(state, n, result)
    {:noreply, new_state}
  end

  defp compute_of(n, state) do
    state
    |> Map.fetch(n)
    |> case do
      {:ok, r} -> r
      :error -> Factorial.of(n)
    end
  end
end
