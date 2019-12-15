defmodule PixieCalendar.Gaps.Gap do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gaps" do
    field :title, :string
    field :reason, :string
    field :start_date, :utc_datetime
    field :end_date, :utc_datetime
    belongs_to :employees, PixieCalendar.Employees
    belongs_to :user, PixieCalendar.Users.User

    timestamps()
  end

  def changeset(gap, params \\ %{}) do
    gap
    |> cast(params, [:title, :reason, :start_date, :end_date, :employees_id, :user_id])
    |> validate_required([:title, :reason, :start_date, :end_date, :employees_id, :user_id])
    |> validate_length(:title, min: 3)
    |> validate_length(:reason, min: 3)
    |> assoc_constraint(:employees)
    |> assoc_constraint(:user)
  end
end
