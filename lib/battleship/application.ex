defmodule Battleship.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BattleshipWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:battleship, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Battleship.PubSub},
      Battleship.Room,
      Battleship.Presence,
      # Start the Finch HTTP client for sending emails
      {Finch, name: Battleship.Finch},
      # Start a worker by calling: Battleship.Worker.start_link(arg)
      # {Battleship.Worker, arg},
      # Start to serve requests, typically the last entry
      BattleshipWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Battleship.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BattleshipWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
