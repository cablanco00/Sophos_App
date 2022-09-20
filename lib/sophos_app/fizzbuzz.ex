defmodule SophosApp.Fizzbuzz do
  alias SophosApp.MyList, as: ML

  def exec(n) do
    ML.generate(n)
  end
end
