defmodule FlexcaseTest do
  use ExUnit.Case
  doctest Flexcase

  import Flexcase.CLI, only: [ parse_args: 1 ]

  test ":help returned if unknown option given" do
    assert parse_args(["-u"]) == :help
    assert parse_args(["--unknown"]) == :help
  end

  test ":snake and words returned if snake given" do
    assert parse_args(["-s", "foo", "bar"]) == { :snake, [ "foo", "bar" ] }
    assert parse_args(["--snake", "foo", "bar"]) == { :snake, [ "foo", "bar" ] }
  end

  test ":camel and words returned if camel given" do
    assert parse_args(["-c", "foo", "bar"]) == { :camel, [ "foo", "bar" ] }
    assert parse_args(["--camel", "foo", "bar"]) == { :camel, [ "foo", "bar" ] }
  end
end
