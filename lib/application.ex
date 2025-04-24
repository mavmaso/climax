defmodule Climax.Application do
  @moduledoc "Climax Application startup"

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Starting application")

    Task.start(fn -> Climax.get_temp("São Paulo") |> IO.puts() end)
    Task.start(fn -> Climax.get_temp("Belo Horizonte") |> IO.puts() end)
    Task.start(fn -> Climax.get_temp("Curitiba") |> IO.puts() end)

    Supervisor.start_link([], strategy: :one_for_one)
  end
end
