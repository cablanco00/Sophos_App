defmodule SophosApp.Fibonacci do
  def secuence(0), do: 0
  def secuence(1), do: 1
  def secuence(n), do: secuence(n - 1) + secuence(n - 2)
end
