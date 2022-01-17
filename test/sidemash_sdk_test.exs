defmodule SidemashSdkTest do
  use ExUnit.Case
  doctest SidemashSdk

  test "greets the world" do
    assert SidemashSdk.hello() == :world
  end
end
