defmodule NinetyNineBottles do
  def sing(count, singer \\ self()) do
    verse(singer, count)
  end

  def verse(singer, count) do
    sing_new_verse(singer, count)

    receive do
      {count} ->
        display_verse(count)
    end
  end

  def sing_new_verse(singer, count) do
    spawn fn -> send(singer, { count }) end
  end

  def display_verse(count) do
    """
    #{count} bottles of Elixir on the wall, #{count} bottles of Elixir.
    Take one down and pass it around, #{count - 1} bottles of Elixir on the wall.
    """
      |> IO.puts
  end
end
