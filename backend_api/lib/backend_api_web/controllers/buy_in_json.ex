defmodule BackendApiWeb.BuyInJSON do
  alias BackendApi.BuyIns.BuyIn

  @doc """
  Renders a list of buy_ins.
  """
  def index(%{buy_ins: buy_ins}) do
    %{data: for(buy_in <- buy_ins, do: data(buy_in))}
  end

  @doc """
  Renders a single buy_in.
  """
  def show(%{buy_in: buy_in}) do
    %{data: data(buy_in)}
  end

  defp data(%BuyIn{} = buy_in) do
    %{
      id: buy_in.id,
      amount_usd: buy_in.amount_usd,
      coins: buy_in.coins
    }
  end
end
