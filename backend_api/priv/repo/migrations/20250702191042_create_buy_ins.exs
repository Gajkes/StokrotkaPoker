defmodule BackendApi.Repo.Migrations.CreateBuyIns do
  use Ecto.Migration

  def change do
    create table(:buy_ins) do
      add :amount_usd, :integer
      add :coins, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :game_id, references(:games, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:buy_ins, [:user_id])
    create index(:buy_ins, [:game_id])
  end
end
