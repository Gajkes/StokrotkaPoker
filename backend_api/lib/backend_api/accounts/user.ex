defmodule BackendApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :nickname, :string
    field :phone, :string
    has_many :buy_ins, BackendApi.BuyIns.BuyIn
    has_many :results, BackendApi.Results.Result

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nickname, :phone])
    |> validate_required([:nickname, :phone])
  end
end
