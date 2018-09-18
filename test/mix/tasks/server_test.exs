defmodule Mix.Tasks.ServerTest do
  use ExUnit.Case

  test "spins up a server on the default host and port" do
    output =
      ExUnit.CaptureIO.capture_io(fn ->
        Mix.Tasks.Server.run([], 0)
      end)

    result = request("http://localhost:4000/test/support/hello.txt")

    assert result == 'world\n'
    assert output =~ "Running"
    assert output =~ "4000"
    assert output =~ "localhost"
  end

  test "spins up a server with host argument" do
    host = "0.0.0.0"

    output =
      ExUnit.CaptureIO.capture_io(fn ->
        Mix.Tasks.Server.run(["--host", host], 0)
      end)

    result = request("http://#{host}:4000/test/support/hello.txt")

    assert result == 'world\n'
    assert output =~ "Running"
    assert output =~ host
  end

  test "spins up a server with port argument" do
    port = "8080"

    output =
      ExUnit.CaptureIO.capture_io(fn ->
        Mix.Tasks.Server.run(["--port", port], 0)
      end)

    result = request("http://localhost:#{port}/test/support/hello.txt")

    assert result == 'world\n'
    assert output =~ "Running"
    assert output =~ port
  end

  defp request(url) do
    :inets.start()

    case :httpc.request(String.to_charlist(url)) do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} ->
        body

      _ ->
        ''
    end
  end
end
