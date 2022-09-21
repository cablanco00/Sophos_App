defmodule SophosApp.AdventOfCode.Day3 do
  def exec(route) do
    String.split(route, "")
    |> rule()
    |> move()
    |> Enum.uniq()
    |> Enum.count()
  end

  defp move(route) do
    Enum.scan(route, fn
      [i, j], [ip, jp] -> [i + ip, j + jp]
    end)
  end

  defp rule(route) do
    Enum.map(route, fn
      "" -> [0, 0]
      ">" -> [0, 1]
      "<" -> [0, -1]
      "^" -> [1, 0]
      "v" -> [-1, 0]
    end)
  end

  def exec2(route) do
    String.split(route, "")
    |> rule()
    |> move_two_santas()
  end

  defp move_two_santas(route) do
    santaRoute =
      route
      |> Enum.with_index()
      |> Enum.map(&(validate(&1,1)))
      |> Enum.filter(fn x -> x != "" end)

    roboSantaRoute =
      route
      |> Enum.with_index()
      |> Enum.map(&(validate(&1,0)))
      |> Enum.filter(fn x -> x != "" end)

    santaMove = move(santaRoute)
    roboSantaMove = move(roboSantaRoute)

    Enum.concat(santaMove, roboSantaMove)
    |> Enum.uniq()
    |> Enum.count()
  end

  defp validate({num, index},1) when rem(index, 2) == 1, do: num
  defp validate({num, index},0) when rem(index, 2) == 0, do: num
  defp validate(_,_), do: ""

end
