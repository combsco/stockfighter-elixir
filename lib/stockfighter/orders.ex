defmodule Stockfighter.Orders do

  def list(venue, account) do
    Stockfighter.request(:get, "venues/" <> venue <> "/accounts/" <> account <> "/orders")
  end
  def list(venue, account, stock) do
    Stockfighter.request(:get, "venues/" <> venue <> "/accounts/" <> account <> "/stocks/" <> stock <> "/orders")
  end

  def place(account, venue, stock, price, qty, direction, type) do
    params = [
      account: account,
      venue: venue,
      stock: stock,
      price: price,
      qty: qty,
      direction: direction,
      orderType: type
    ]

    Stockfighter.request(:post, "venues/" <> venue <> "/stocks/" <> stock <> "/orders", params)
  end

  def cancel(id, venue, stock) do
    Stockfighter.request(:delete, "venues/" <> venue <> "/stocks/" <> stock <> "/orders" <> id)
  end

  def status(id, venue, stock) do
    Stockfighter.request(:get, "venues/" <> venue <> "/stocks/" <> stock <> "/orders" <> id)
  end
end
