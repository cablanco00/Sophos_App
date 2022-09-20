defmodule SophosApp.Math do
  def sum(a,b) do
    a+b
  end
  def kind(0), do: :zero
  def kind(n) when n > 0, do: :positive
  def kind(n) when n < 0, do: :negative

end

#defmodule SophosApp.Geometry do
#  defmodule Rectangle do
#    def area(a,b), do: a * b
#  end
#end

defmodule SophosApp.Geometry.Rectangle do
  def area(a), do: area(a,a)
  def area(a,b), do: a * b
end
