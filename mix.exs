defmodule Stockfighter.Mixfile do
  use Mix.Project

  def project do
    [app: :stockfighter,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:httpoison, :exjsx],
     mod: {Stockfighter, []}]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:exjsx, "~> 3.2.0"},
      {:poison, "~> 1.5"}
    ]
  end

  defp description do
    """
    A Stockfighter wrapper for elixir

    Requires an active account and api/session key from Stockfighter (http://stockfighter.io)
    """
  end

  defp package do
    [ files: [ "lib", "mix.exs", "README.md"],
      contributors: [ "Chris Combs" ],
      licenses: [ "MIT" ],
      links: %{ "GitHub" => "https://github.com/combsco/stockfighter-elixir"}]
  end
end
