# Feihong's Phoenix Quickstart

## Installation

```
brew install elixir
elixir -v     # check versions, must be Elixir 1.4+ and Erlang 18+
mix local.hex --force
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force
```

Source: [Phoenix Installation Guide](https://hexdocs.pm/phoenix/installation.html)

## Getting started

Create project with bare minimum Phoenix setup

`mix phx.new hello --no-brunch --no-ecto`

Start Phoenix server

`mix phx.server`

Run app inside IEx (Interactive Elixir)

`iex -S mix phx.server`
