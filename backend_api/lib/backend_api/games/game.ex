defmodule BackendApi.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :date, :utc_datetime
    field :notes, :string
    field :buy_in, :integer
    has_many :buy_ins, BackendApi.BuyIns.BuyIn
    has_many :results, BackendApi.Results.Result

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:date, :notes, :buy_in])
    |> validate_required([:date, :notes, :buy_in])
  end
end
