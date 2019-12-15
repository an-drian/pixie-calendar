defmodule PixieCalendar do
  @moduledoc """
  PixieCalendar keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  import Ecto.Query

  alias PixieCalendar.{ Employees, Gaps.Gap, Repo }

  @repo Repo

  def get_employee(id) do
    @repo.get!(Employees, id)
  end

  def edit_employee(id) do
    get_employee(id)
    |> Employees.changeset()
  end

  def update_employee(%Employees{} = employee, update) do
    employee
    |> Employees.changeset(update)
    |> @repo.update()
  end

  def list_employees do
    @repo.all(Employees)
  end

  def list_employees_with_limit(limit \\ 10) do
    query =
      from e in Employees,
        limit: ^limit

    @repo.all(query)
  end

  def insert_employee(attrs) do
    %Employees{}
    |> Employees.changeset(attrs)
    |> @repo.insert()
  end

  def insert_gap(attrs) do
    %Gap{}
    |> Gap.changeset(attrs)
    |> @repo.insert()
  end

  def get_gaps_by() do

  end

  def new_gap,  do: Gap.changeset(%Gap{})
  def new_employee, do: Employees.changeset(%Employees{})
end
