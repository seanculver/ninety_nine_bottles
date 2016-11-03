defmodule NinetyNineBottlesTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "Starts the program" do
    execute_run = fn ->
      NinetyNineBottles.run(1)
    end

    assert capture_io(execute_run) =~
    """
    1 bottles of Elixir on the wall, 1 bottles of Elixir.
    Take one down and pass it around, 0 bottles of Elixir on the wall.
    """
  end
end
