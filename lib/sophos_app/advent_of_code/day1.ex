defmodule SophosApp.AdventOfCode.Day1 do
  import String, only: [split: 3]

  def exec(floors) do
    floors
    |> split( "", trim: true)
    |> steps()
    |> Enum.sum()
  end

  def steps(list) do
    Enum.map(list, fn
      "" -> 0
      "(" -> 1
      ")" -> -1 end)
  end

  def second_exec(floors) do
    floors
    |> split("", trim: true)
    |> steps()
    |> Enum.scan(&(&1 + &2))
    |> Enum.find_index(fn p -> p == -1 end)
    |> position()
end

defp position(e), do: e + 1
end
