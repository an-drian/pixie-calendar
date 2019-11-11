defmodule PixieCalendarWeb.EmployeesController do
  use PixieCalendarWeb, :controller

  def index(conn, _params) do
    employees = PixieCalendar.list_employees_with_limit(5)
    render(conn, "index.html", %{ employees: employees })
  end

  def new(conn, _params) do
    new_employee_changeset = PixieCalendar.new_employee()
    render(conn, "new.html", %{ new_employee_changeset: new_employee_changeset })
  end

  def create(conn, %{ "employees" => employee_params }) do
    case PixieCalendar.insert_employee(employee_params) do
      { :ok, _employee } -> redirect(conn, to: Routes.employees_path(conn, :index))
      { :error, new_employee_changeset } -> render(conn, "new.html", %{ new_employee_changeset: new_employee_changeset })
    end

    |>
    render(conn, "new.html")
  end
end
