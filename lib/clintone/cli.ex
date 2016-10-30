defmodule Clintone.CLI do
  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
                               switches: [ snake: :boolean,
                                           camel: :boolean ],
                               aliases:  [ s: :snake,
                                           c: :camel ])
    case parse do
      { [ snake: true ], words, _ } -> { :snake, words }
      { [ camel: true ], words, _ } -> { :camel, words }
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage:
      clintone -s fooBar hogeFuga
      clintone -c foo_bar hoge_fuga
    """
    System.halt(0)
  end

  def process({:snake, words}) do
    do_process(&Inflex.underscore/1, words)
  end

  def process({:camel, words}) do
    do_process(&(Inflex.camelize(&1, :lower)), words)
  end

  defp do_process(inflex, words) do
    words
    |> Enum.map(inflex)
    |> Enum.join("\n")
    |> IO.puts
  end
end