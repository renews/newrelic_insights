defmodule NewrelicInsights.MixProject do
  use Mix.Project

  def project do
    [
      app: :newrelic_insights,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "This fly into the sky",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.0.0-beta.1"},
      {:jason, ">= 1.0.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package do
    [
      maintainers: [" Renê Schneider, Thales Flores "],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/renews/newrelic_insights"}
    ]
  end
end
