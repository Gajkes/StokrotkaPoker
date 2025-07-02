defmodule BackendApi.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :date, :utc_datetime
      add :notes, :string
      add :buy_in, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
