defmodule FlexcaseTest do
  use ExUnit.Case
  doctest Flexcase

  import Flexcase.CLI, only: [ parse_args: 1 ]

  test ":help returned if invalid args given" do
    assert parse_args(["-u"]) == :help
    assert parse_args(["--unknown"]) == :help
    assert parse_args(["-s"]) == :help
    assert parse_args(["-c"]) == :help
  end

  test ":snake and words returned if snake given" do
    assert parse_args(["-s", "foo\nbar"]) == { :snake, "foo\nbar" }
    assert parse_args(["--snake", "foo\nbar"]) == { :snake, "foo\nbar" }
  end

  test ":camel and words returned if camel given" do
    assert parse_args(["-c", "foo\nbar"]) == { :camel, "foo\nbar" }
    assert parse_args(["--camel", "foo\nbar"]) == { :camel, "foo\nbar" }
  end
end
