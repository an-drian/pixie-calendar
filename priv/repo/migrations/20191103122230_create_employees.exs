defmodule PixieCalendar.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string, null: false
      add :position, :string, null: false

      timestamps()
    end
  end
end
