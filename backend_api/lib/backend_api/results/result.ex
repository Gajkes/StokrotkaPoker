defmodule BackendApi.Results.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :coins_delta, :integer

    belongs_to :user, BackendApi.Accounts.User
    belongs_to :game, BackendApi.Games.Game

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:coins_delta])
    |> validate_required([:coins_delta])
  end
end
