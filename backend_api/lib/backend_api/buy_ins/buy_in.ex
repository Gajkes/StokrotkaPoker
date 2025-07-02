defmodule BackendApi.BuyIns.BuyIn do
  use Ecto.Schema
  import Ecto.Changeset

  schema "buy_ins" do
    field :amount_usd, :integer
    field :coins, :integer

    belongs_to :user, BackendApi.Accounts.User
    belongs_to :game, BackendApi.Games.Game

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(buy_in, attrs) do
    buy_in
    |> cast(attrs, [:amount_usd, :coins])
    |> validate_required([:amount_usd, :coins])
  end
end
