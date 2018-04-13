defmodule NewrelicInsights.Client do
  use Tesla
  require OK
  alias NewrelicInsights.Configuration
  alias NewrelicInsights.Data

  plug(Tesla.Middleware.JSON)

  # build dynamic client based on runtime arguments
  def call(data) do
    OK.with do
      account_id <- Configuration.account_id()
      api_key <- Configuration.api_key()
      build_request(account_id, api_key) |> send_request(data)
    else
      :unhandled_error ->
        OK.failure(:unknow)
    end
  end

  defp send_request(client, data) do
    OK.with do
      body <- Data.validate_data(data)

      client
      |> post("", body)
      |> handle_response
    else
      :unhandled_error ->
        OK.failure(:unknow)
    end
  end

  defp build_request(account_id, api_key) do
    Tesla.build_client([
      {Tesla.Middleware.Headers,
       [{"Content-Type", "application/json"}, {"X-Insert-Key", api_key}]},
      {Tesla.Middleware.BaseUrl,
       "https://insights-collector.newrelic.com/v1/accounts/" <> account_id <> "/events"}
    ])
  end

  defp handle_response({:ok, response}) do
    cond do
      response.status != 200 ->
        {:error, "[newrelic_insights] Something wrong with your configuration values."}

      true ->
        {:ok, "Success."}
    end
  end
end
