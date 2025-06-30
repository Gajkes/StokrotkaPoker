defmodule BackendApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BackendApiWeb.Telemetry,
      BackendApi.Repo,
      {DNSCluster, query: Application.get_env(:backend_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BackendApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BackendApi.Finch},
      # Start a worker by calling: BackendApi.Worker.start_link(arg)
      # {BackendApi.Worker, arg},
      # Start to serve requests, typically the last entry
      BackendApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BackendApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BackendApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
