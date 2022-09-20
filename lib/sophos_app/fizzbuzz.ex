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
  defp fizzbuzz_transform([h | t], list_fizbuzz), do: fizzbuzz_transform(t, list_fizbuzz ++ [evaluate(h)])

  defp evaluate(h) when rem(h, 5) == 0 and rem(h, 3) == 0, do: "FizzBuzz"
  defp evaluate(h) when rem(h, 3) == 0, do: "Fizz"
  defp evaluate(h) when rem(h, 5) == 0 or rem(h, 3) == 0, do: "Buzz"
  defp evaluate(h), do: h

  @doc """
  FizzBuzz con case
  """
  def fizz_buzz_case(n) do
    n
    |> ML.generate()
    |> process_list_case([])

  end

  defp process_list_case([], l), do: l
  defp process_list_case([h | t], l) do
    e =
      case h do
        h when rem(h, 15) == 0 -> :fizz_buzz
        h when rem(h, 3) == 0 -> :fizz
        h when rem(h, 5) == 0 -> :buzz
        h -> h
      end
    process_list_case(t, l ++ [e])
  end

  @doc """
  FizzBuzz con cond
  """
  def fizz_buzz_cond(n) do
    n
    |> ML.generate()
    |> process_list_cond([])

  end

  defp process_list_cond([], l), do: l
  defp process_list_cond([h | t], l) do
    e =
      cond do
        rem(h, 15) == 0 -> :fizz_buzz
        rem(h, 3) == 0 -> :fizz
        rem(h, 5) == 0 -> :buzz
        true -> h
      end
    process_list_cond(t, l ++ [e])
  end
end
