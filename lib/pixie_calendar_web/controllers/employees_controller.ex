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
  end

  def edit(conn, %{ "id" => id }) do
    edit_employee_changeset = PixieCalendar.edit_employee(id)
    render(conn, "edit.html", %{ edit_employee_changeset: edit_employee_changeset, id: id })
  end

  def update(conn, %{"id" => id, "employees" => employee_params }) do
    employee = PixieCalendar.get_employee(id)

    case PixieCalendar.update_employee(employee, employee_params) do
      { :ok, _ } -> redirect(conn, to: Routes.employees_path(conn, :index))
      { :error, edit_employee_changeset } -> render(conn, "edit.html", %{ edit_employee_changeset: edit_employee_changeset, id: id })
    end
  end
end
