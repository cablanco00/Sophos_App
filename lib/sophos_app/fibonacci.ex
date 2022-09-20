defmodule SophosApp.Fibonacci do
  def secuence(0), do: 0
  def secuence(1), do: 1
  def secuence(n), do: secuence(n - 1) + secuence(n - 2)

  @doc """
  Tarea
  """
  def sequence_with_tail(n) do
    do_sequence(n, 1, [1,0])
  end

  defp do_sequence(n, n, [h | _]), do: h

  defp do_sequence(n, i, [n1, n2 | _t] = l) do
    do_sequence(n, i + 1, [n1 + n2 | l])
  end
end
