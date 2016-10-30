defmodule ClintoneTest do
  use ExUnit.Case
  doctest Clintone

  import Clintone.CLI, only: [ parse_args: 1 ]

  test ":help returned if unknown option given" do
    assert parse_args(["-u"]) == :help
    assert parse_args(["--unknown"]) == :help
  end

  test ":snake returned if snake given" do
    assert parse_args(["-s"]) == :snake
    assert parse_args(["--snake"]) == :snake
  end

  test ":camel returned if camel given" do
    assert parse_args(["-c"]) == :camel
    assert parse_args(["--camel"]) == :camel
  end
end
