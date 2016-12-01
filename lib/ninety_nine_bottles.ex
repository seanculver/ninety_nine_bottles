defmodule NinetyNineBottles do
  def sing(count, singer \\ self()) do
    verse(singer, count)
  end

  def verse(singer, count) do
    sing_new_verse(singer, count)

    receive do
      {singer, new_verse, 0} ->
        display_end
      {singer, new_verse, count} ->
        display_verse(new_verse, count)
        verse(singer, count - 1)
    end
  end

  def sing_new_verse(singer, count) do
    spawn fn -> send(singer, {singer, self(), count}) end
  end

  def display_end do
    IO.puts "Go code some more, 99 bottles of Elixir on the wall."
  end

  def display_verse(new_verse, count) when count == 1 do
    IO.puts """
    #{inspect new_verse} #{count} bottle of Elixir on the wall, #{count} bottle of Elixir.
    Take one down and pass it around, #{count - 1} bottles of Elixir on the wall.
    """
  end

  def display_verse(new_verse, count) when count == 2 do
    IO.puts """
    #{inspect new_verse} #{count} bottles of Elixir on the wall, #{count} bottles of Elixir.
    Take one down and pass it around, #{count - 1} bottle of Elixir on the wall.
    """
  end

  def display_verse(new_verse, count) do
    IO.puts """
    #{inspect new_verse} #{count} bottles of Elixir on the wall, #{count} bottles of Elixir.
    Take one down and pass it around, #{count - 1} bottles of Elixir on the wall.
    """
  end
end
