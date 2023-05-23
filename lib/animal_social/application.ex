defmodule AnimalSocial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AnimalSocial.Repo,
      # Start the Telemetry supervisor
      AnimalSocialWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AnimalSocial.PubSub},
      # Start the Endpoint (http/https)
      AnimalSocialWeb.Endpoint
      # Start a worker by calling: AnimalSocial.Worker.start_link(arg)
      # {AnimalSocial.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AnimalSocial.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AnimalSocialWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
