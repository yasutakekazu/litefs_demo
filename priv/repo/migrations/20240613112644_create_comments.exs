defmodule LitefsDemo.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :text

      timestamps(type: :utc_datetime)
    end
  end
end
