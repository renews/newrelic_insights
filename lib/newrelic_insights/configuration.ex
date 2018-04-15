defmodule NewrelicInsights.Configuration do
  @moduledoc """
  Handle configuration set on our environment files.
  """

  def account_id do
    Application.fetch_env!(:newrelic_insights, :account_id)
    |> check_configuration
  end

  def api_key do
    Application.fetch_env!(:newrelic_insights, :api_key)
    |> check_configuration
  end

  defp check_configuration(config) do
    case config do
      false -> {:error, "[newrelic_insights] Configuration not correctly set."}
      _ -> {:ok, config}
    end
  end
end
