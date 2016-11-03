defmodule NinetyNineBottles do
  def run(count) do
    """
    #{count} bottles of Elixir on the wall, #{count} bottles of Elixir.
    Take one down and pass it around, #{count - 1} bottles of Elixir on the wall.
    """
      |> IO.puts
  end
end
