defmodule Stockfighter.Venues do
  def heartbeat(venue) do
    Stockfighter.request(:get, "venues/" <> venue <> "/heartbeat")
  end

  def stocks(venue) do
    Stockfighter.request(:get, "venues/" <> venue <> "/stocks")
  end
  def stocks(venue, stock) do
    Stockfighter.request(:get, "venues/" <> venue <> "/stocks/" <> stock)
  end

  def quote(venue, stock) do
    Stockfighter.request(:get, "venues/" <> venue <> "/stocks/" <> stock <> "/quote")
  end
end
