defmodule Clintone.CLI do
  def main(argv) do
    words = read_stdin
    argv
    |> parse_args
    |> process(words)
  end

  def read_stdin() do
    IO.read(:stdio, :all)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
                               switches: [ snake: :boolean,
                                           camel: :boolean ],
                               aliases:  [ s: :snake,
                                           c: :camel ])
    case parse do
      { [ snake: true ], _, _ } -> :snake
      { [ camel: true ], _, _ } -> :camel
      _ -> :help
    end
  end

  def process(:help, _) do
    IO.puts """
    usage:
      echo "fooBar hogeFuga" | ./clintone -s
      echo "foo_bar hoge_fuga" | ./clintone -c
    """
    System.halt(0)
  end

  def process(:snake, words) do
    do_process(&Inflex.underscore/1, words)
  end

  def process(:camel, words) do
    do_process(&(Inflex.camelize(&1, :lower)), words)
  end

  defp do_process(intone, words) do
    intone.(words) |> IO.puts
  end
end
