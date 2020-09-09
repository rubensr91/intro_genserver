defmodule IntroGenserverTest do
  use ExUnit.Case
  doctest IntroGenserver

  test "greets the world" do
    assert IntroGenserver.hello() == :world
  end
end
