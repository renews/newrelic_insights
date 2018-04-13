# NewrelicInsights

## Installation

The package can be installed
by adding `newrelic_insights` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:newrelic_insights, "~> 1.0.0"}
  ]
end
```

### Configuration

Leave it at your `config.ex` while developing.
In deployed apps place it at `prod.ex`

```elixir
config :newrelic_insights,
  api_key: "NEWRELIC_API_KEY",
  account_id: "NEW_RELIC_ACCOUNT_ID"
```

### Usage

`Newrelic_insights.send_event(data)`

#### Sample Data

```elixir
data = [ %{ "eventType": "Purchase", "account": 3, "amount": 259.54 }, %{ "eventType": "Purchase", "account": 5, "amount": 12309, "product": "Item" }]]
```

## IMPORTANT

* Every map inside the list MUST HAVE the key: `eventType`
* The value of `eventType` can't be blank.

The docs can be found at [https://hexdocs.pm/newrelic_insights](https://hexdocs.pm/newrelic_insights).

<!-- https://docs.newrelic.com/docs/insights/insights-data-sources/custom-data/insert-custom-events-insights-api#json-format -->
