defmodule NewrelicInsights do
  @moduledoc """
  Documentation for NewrelicInsights.
  """

  @doc """
  Send the desired event to NewRelic Insights.
  The data parameters have to be a LIST of MAP's, and each map must have
  a key named `EventType`.

  ```ex
    [%{EventType: "MyEveneType", thing: 1, what: "is this"},%{EventType: "MyEveneType", thing: 2}]
    |> NewrelicInsights.send_event
  ```

  """

  def send_event(data) do
    data
    |> NewrelicInsights.Client.call()
  end
end
