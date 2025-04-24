defmodule Climax.MixProject do
  use Mix.Project

  def project do
    [
      app: :climax,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Climax.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.5.0"},
      {:mimic, "~> 1.10", only: :test}
    ]
  end

  defp aliases do
    [
      start: ["run --no-halt"],
      lint: ["format"]
    ]
  end
end
