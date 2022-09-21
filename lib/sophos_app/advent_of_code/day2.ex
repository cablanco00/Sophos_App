defmodule SophosApp.AdventOfCode.Day2 do
  def exec(input) do
    input
    |> String.split("\n", trim: true)
    |> IO.inspect()
    |> Enum.map(&String.split(&1, "x", trim: true))
    |> IO.inspect()
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
    |> IO.inspect()
    |> Enum.map(&area/1)
    |> Enum.sum()

  end

  defp area([l,w,h]) do
    areas = [l*w, w*h, l*h]

    areas
    |> Enum.sum()
    |> Kernel.*(2)
    |> Kernel.+(Enum.min(areas))
  end

  def exec2(input) do
    input
    |> String.split("\n", trim: true)
    |> IO.inspect()
    |> Enum.map(&String.split(&1, "x", trim: true))
    |> IO.inspect()
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
    |> Enum.map(&liston/1)
    |> Enum.sum()

  end
  defp liston(dimensions) do
    [min,min2,tail] = dimensions |> Enum.sort( )
    bow = min*min2*tail
    length = min*2+min2*2
    bow+length
  end
end
