defmodule NinetyNineBottlesTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "Displays a single verse" do
    execute_run = fn ->
      NinetyNineBottles.sing(1)
    end

    assert capture_io(execute_run) =~
    """
    1 bottles of Elixir on the wall, 1 bottles of Elixir.
    Take one down and pass it around, 0 bottles of Elixir on the wall.
    """
  end

  test "Singer receives the count from a process" do
    singer = self()
    NinetyNineBottles.sing_new_verse(singer, 1)

    assert_receive {1}
  end
end
