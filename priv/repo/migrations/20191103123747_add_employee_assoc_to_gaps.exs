defmodule PixieCalendar.Repo.Migrations.AddEmployeeAssocToGaps do
  use Ecto.Migration

  def change do
    alter table(:gaps) do
      add :employees_id, references(:employees)
      add :user_id, references(:users)
    end

    create index(:gaps, [:employees_id])
    create index(:gaps, [:user_id])
    create index(:gaps, [:employees_id, :user_id])
  end
end
