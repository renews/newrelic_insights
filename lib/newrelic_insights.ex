defmodule NewrelicInsights do
  @moduledoc """
  Documentation for NewrelicInsights.
  """

  @doc """
  Hello world.

  ## Examples

      iex> NewrelicInsights.hello
      :world

  """
  def send_event(data) do
    data
    |> NewrelicInsights.Client.call()
  end
end
