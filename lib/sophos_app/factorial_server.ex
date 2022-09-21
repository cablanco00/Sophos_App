defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial

  def handle_message(caller) do
    receive do
      {:compute, n} ->
        send( caller, {:factorial, n, Factorial.of(n) })
        handle_message(caller)

      {:status} ->
        send(caller, {:ok, caller})
        handle_message(caller)

      {:exit, reason}  ->
        IO.puts("bye for #{inspect(reason)}")

      _message ->
        IO.inspect("Bad operation")
        handle_message(caller)
    end
  end
end
