defmodule PixieCalendar.Employees.Employee do
  use Ecto.Schema

  schema "employee" do
    field :name, :string
    field :position, :string
    has_many :gaps, PixieCalendar.Gaps.Gap

    timestamps()
  end
end
