defmodule SophosApp.AdventOfCode do
  @moduledoc """
  Solucion adven of code
  """
  @doc """
  Solucion 1:
  """
  def deliver(inst) do
    inst
    |> String.split("", trim: true)
    |> evaluate(0)
  end

  defp evaluate([],floor), do: floor
  defp evaluate([h | t],floor), do:  evaluate(t,walk(floor,h))
  defp walk(floor, "("), do: floor + 1
  defp walk(floor, ")"), do: floor - 1

  @doc """
  Solucion 2
  """
  def deliver2(inst) do
    inst
    |> String.split("", trim: true)
    |> transform([])
    |> SophosApp.MyList.sum()
  end

  defp transform([], list), do: list
  defp transform(["(" | t], list), do: transform(t,[1 | list])
  defp transform([")" | t], list), do: transform(t,[-1 | list])

end
