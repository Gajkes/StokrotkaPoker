defmodule BackendApi.BuyInsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BackendApi.BuyIns` context.
  """

  @doc """
  Generate a buy_in.
  """
  def buy_in_fixture(attrs \\ %{}) do
    {:ok, buy_in} =
      attrs
      |> Enum.into(%{
        amount_usd: 42,
        coins: 42
      })
      |> BackendApi.BuyIns.create_buy_in()

    buy_in
  end
end
