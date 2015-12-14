defmodule Stockfighter do
  use Application
  use HTTPoison.Base

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Stockfighter.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stockfighter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def process_url(endpoint) do
    "https://api.stockfighter.io/ob/api/" <> endpoint
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  def process_request_headers(headers) do
    Enum.into(headers, [{"X-Starfighter-Authorization", Stockfighter.key}])
    #[{"X-Starfighter-Authorization", Stockfighter.key} | headers]
  end

  def request(method, endpoint, body) when method == :post do
    Stockfighter.post!(endpoint, JSX.encode! body).body
  end
  def request(method, endpoint, body) when method == :get do
    Stockfighter.get!(endpoint, JSX.encode! body).body
  end
  def request(method, endpoint, body) when method == :delete do
    Stockfighter.delete!(endpoint, JSX.encode! body).body
  end

  def key do
    Application.get_env(:stockfighter, :key) ||
      System.get_env("STOCKFIGHTER_KEY")
  end
end
