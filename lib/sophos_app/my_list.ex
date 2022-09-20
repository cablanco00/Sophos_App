defmodule SophosApp.MyList do
  def sum(list), do: sum(list, 0)
  defp sum([], n), do: n
  defp sum([h| t], n), do: sum(t, n + h)

  def filter_current_files() do
    "."
    |> Path.join("**/*.ex")
    |> Path.wildcard()
    |> Enum.filter(fn f ->
      String.contains?(Path.basename(f),"application")
    end)
  end

  def generate(n) when n > 0 do
    generate(n, [])
  end

  defp generate(0, list) do
    list
  end

  defp generate(n, list) do
    generate(n-1, [n | list])
  end

  @doc """
  Tarea apply list y count list
  """

  def apply_to_list(list)  do
    apply_to(list, [])
  end

  defp apply_to([], element), do: element
  defp apply_to([h | t], element),  do: apply_to(t, element ++ [h*3] )

  def count_list(list)  do
    count(list, 0)
  end

  defp count([], n), do: n
  defp count([_ | t], n),  do: count(t, n + 1 )

end
