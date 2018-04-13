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

  def application do
    [
      extra_applications: [:logger],
      env: [account_id: false, api_key: false]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.0.0-beta.1"},
      {:jason, ">= 1.0.0"}
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
