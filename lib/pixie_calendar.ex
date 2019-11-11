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

  def new_employee, do: Employees.changeset(%Employees{})
end
