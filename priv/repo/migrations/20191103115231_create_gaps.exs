defmodule PixieCalendar.Repo.Migrations.CreateGaps do
  use Ecto.Migration

  def change do
    create table(:gaps) do
      add :title, :string, null: false
      add :reason, :string, null: false
      add :start_date, :utc_datetime, null: false
      add :end_date, :utc_datetime, null: false

      timestamps()
    end
  end
end
