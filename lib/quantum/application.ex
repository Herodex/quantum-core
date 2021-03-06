defmodule Quantum.Application do
  @moduledoc """
  Start needed dynamic applications
  """

  use Application

  @deps Application.get_env(:quantum, :date_library, Quantum.DateLibrary.Timex)

  if @deps do
    def start(_type, _args) do
      Application.ensure_all_started(@deps, :permanent)
      children = []
      opts = [strategy: :one_for_one, name: Quantum.Supervisor]
      Supervisor.start_link(children, opts)
    end
  else
    def start(_type, _args) do
      children = []
      opts = [strategy: :one_for_one, name: Quantum.Supervisor]
      Supervisor.start_link(children, opts)
    end
  end
end
