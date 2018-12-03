defmodule MixServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :mix_server,
      description: "A simple mix task to start a (simple) http server on the current dir",
      version: "0.1.0",
      elixir: "~> 1.6",
      package: [
        licenses: ["MIT"],
        links: %{github: "https://github.com/mracos/mix_server"}
      ]
    ]
  end
end
