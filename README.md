<h1 align="center">mix_server</h1>
<blockquote align="center">A simple mix task to start a (simple) http server on the current dir</blockquote>

![Travis (.org)](https://img.shields.io/travis/mracos/mix_server.svg?style=flat-square)

The simplicity of `python -m http.server` with the power of Elixir/Erlang.

## Install

You can install with
- `mix archive.install github mracos/mix_server`

## Usage

You can start the server on the current directory with:
- `mix server`

By default, it starts a server on `localhost` at the `4000` port

With the `document_root` being the current dir (`$PWD`)

You can also pass the  optinoal parameters of `host` and `port`
- `mix server --port 1234 --host 0.0.0.0`

That's it, really, nothing more.

:duck:
