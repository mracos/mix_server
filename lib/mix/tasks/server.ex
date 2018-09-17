defmodule Mix.Tasks.Server do
  use Mix.Task

  @shortdoc "Starts a basic HTTP server on the current dir"
  @moduledoc """
  It starts a basic HTTP server on the current directory

  You can pass the following arguments:

  - `--host`
    Is the address that the server will bind to, can be a
    FQDN or an IP address

    Examples:
      - `--host 0.0.0.0`
      - `--host example.com`

  - `--port`
    The port that the server will bind to
  """

  @default_port 4000
  @default_host 'localhost'
  @shell Mix.shell()

  def run(argv, sleep_time \\ :infinity) do
    {opts, _} = OptionParser.parse_head!(
      argv,
      switches: [
        port: [:integer, :keep],
        host: :string,
      ]
    )

    host = if opts[:host], do: String.to_charlist(opts[:host]), else: @default_host
    port = opts[:port] || @default_port

    @shell.info("Running basic http server on #{host}:#{port}")

    :inets.start()
    :inets.start(:httpd, [
      server_name: 'localhost',
      port: port,
      bind_address: host,
      document_root: '.',
      server_root: '.',
      directory_index: ['index.html']
    ])

    Process.sleep(sleep_time)
  end
end
