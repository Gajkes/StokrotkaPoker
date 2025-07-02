defmodule BackendApi.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :coins_delta, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :game_id, references(:games, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:results, [:user_id])
    create index(:results, [:game_id])
  end
end
