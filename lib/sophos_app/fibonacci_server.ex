defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def start () do
    spawn(__MODULE__, :loop, [])
  end

  def start_link () do
    spawn_link(__MODULE__, :loop, [])
  end

  def start_monitor () do
    spawn_monitor(__MODULE__, :loop, [])
  end

  def loop() do
    receive do
      {:sequence, caller, n} ->
        result = Fibonacci.secuence(n)
        send caller, {:fibonacci, n, result, }
        loop()

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")
        loop()

      {:exit, reason}  ->
        IO.puts("bye for #{inspect(reason)}")

      message ->
        IO.inspect(message)
        loop()
    end
  end
end
