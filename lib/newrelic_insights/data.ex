defmodule NewrelicInsights.Data do
  def validate_data(data) do
    case invalid_keys(data) do
      0 ->
        {:ok, data}

      _ ->
        {:error, "[newrelic_insights] eventType must be in all maps and can't be blank."}
    end
  end

  defp invalid_keys(data) do
    data
    |> Enum.reject(fn m -> m |> valid_value? end)
    |> Enum.count()
  end

  defp valid_value?(data) do
    Map.has_key?(data, :eventType) && is_bitstring(data.eventType) && data.eventType != ""
  end
end
