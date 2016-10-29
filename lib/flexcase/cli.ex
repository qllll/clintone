defmodule Flexcase.CLI do
  def run(argv) do
    argv
    |> parse_args
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
                               switches: [ snake: :boolean,
                                           camel: :boolean ],
                               aliases:  [ s: :snake,
                                           c: :camel ])
    case parse do
      { [ snake: true ], [ words ], _ } -> { :snake, words }
      { [ camel: true ], [ words ], _ } -> { :camel, words }
      _ -> :help
    end
  end
end
