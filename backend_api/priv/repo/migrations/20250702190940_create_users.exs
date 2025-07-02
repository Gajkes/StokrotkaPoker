defmodule BackendApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nickname, :string
      add :phone, :string

      timestamps(type: :utc_datetime)
    end
  end
end
