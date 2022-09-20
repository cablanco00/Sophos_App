defmodule SophosApp.Fizzbuzz do
  alias SophosApp.MyList, as: ML

  def exec(n) do
    ML.generate(n)
    |> transform()
  end

  @doc """
  Tarea
  """

  def transform(list) do
    fizzbuzz_transform(list,[])
  end

  defp fizzbuzz_transform([], list_fizbuzz), do: list_fizbuzz
  defp fizzbuzz_transform([h | t], list_fizbuzz), do: fizzbuzz_transform(t, [evaluate(h) | list_fizbuzz])

  defp evaluate(h) when rem(h, 5) == 0 and rem(h, 3) == 0, do: "FizzBuzz"
  defp evaluate(h) when rem(h, 3) == 0, do: "Fizz"
  defp evaluate(h) when rem(h, 5) == 0 or rem(h, 3) == 0, do: "Buzz"
  defp evaluate(h), do: h
end
