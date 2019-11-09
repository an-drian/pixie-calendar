defmodule PixieCalendar.Gaps.Gap do
  use Ecto.Schema

  schema "gaps" do
    field :title, :string
    field :reason, :string
    field :start_date, :utc_datetime
    field :end_date, :utc_datetime
    belongs_to :employee, PixieCalendar.Employees.Employee
    belongs_to :user, PixieCalendar.Users.User

    timestamps()
  end
end
