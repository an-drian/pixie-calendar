defmodule PixieCalendar.Employees do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :name, :string
    field :position, :string
    has_many :gaps, PixieCalendar.Gaps.Gap

    timestamps()
  end

  def changeset(employee, params \\ %{}) do
    employee
    |> cast(params, [:name, :position])
    |> validate_required([:name, :position])
    |> validate_length(:name, min: 3)
    |> validate_length(:name, max: 256)
    |> validate_length(:position, min: 2)
    |> validate_length(:position, max: 256)
  end
end
