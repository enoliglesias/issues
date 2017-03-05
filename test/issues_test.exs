defmodule IssuesTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help" do
    assert parse_args(["-h", "wadus"]) == :help
    assert parse_args(["--help", "wadus"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["enol", "issues", "10"]) == {"enol", "issues", 10}
  end

  test "three values returned with default count when two params given" do
    assert parse_args(["enol", "issues"]) == {"enol", "issues", 4}
  end

end
