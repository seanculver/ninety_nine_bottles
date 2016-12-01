defmodule NinetyNineBottlesTest do
  use ExUnit.Case
  require Logger

  import ExUnit.CaptureIO

  test "Singer receives the singer pid, new pid, and count from a process" do
    singer = self()
    NinetyNineBottles.sing_new_verse(singer, 1)

    assert_receive {pid1, pid2, 1}
    assert pid1 == singer
    refute pid1 == pid2
  end

  test "Displays a singular end verse" do
    verse_pid = self()
    execute_run = fn ->
      NinetyNineBottles.display_verse(verse_pid, 1)
    end

    assert capture_io(execute_run) ==
    """
    #{inspect verse_pid} 1 bottle of Elixir on the wall, 1 bottle of Elixir.
    Take one down and pass it around, 0 bottles of Elixir on the wall.

    """
  end

  test "Displays a singular verse" do
    verse_pid = self()
    execute_run = fn ->
      NinetyNineBottles.display_verse(verse_pid, 2)
    end

    assert capture_io(execute_run) ==
    """
    #{inspect verse_pid} 2 bottles of Elixir on the wall, 2 bottles of Elixir.
    Take one down and pass it around, 1 bottle of Elixir on the wall.

    """
  end

  test "Displays a plural verse" do
    verse_pid = self()
    execute_run = fn ->
      NinetyNineBottles.display_verse(verse_pid, 3)
    end

    assert capture_io(execute_run) ==
    """
    #{inspect verse_pid} 3 bottles of Elixir on the wall, 3 bottles of Elixir.
    Take one down and pass it around, 2 bottles of Elixir on the wall.

    """
  end
end
