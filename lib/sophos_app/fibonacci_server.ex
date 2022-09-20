defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def loop() do
    receive do
      {:sequence, n} ->
        Fibonacci.secuence(n)
        |> IO.inspect()
        loop()

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")
        loop()

      message ->
        IO.inspect(message)
        loop()
    end
  end
end
