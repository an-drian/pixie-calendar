defmodule PixieCalendarWeb.GapsController do
  use PixieCalendarWeb, :controller

  def index(conn, %{"employees_id" => employees_id}) do
    { int_id, _ } = Integer.parse(employees_id)
    gaps = PixieCalendar.get_gaps_by_employee_id(int_id)

    IO.inspect(gaps)
    render(conn, "index.html", %{ gaps: gaps })
  end

  def new(conn, %{ "employees_id" => employees_id }) do
    employee = PixieCalendar.get_employee(employees_id)
    gap = PixieCalendar.new_gap()

    render(conn, "new.html", %{ gap: gap, employee: employee })
  end

  def create(conn, %{ "employees_id" => employees_id, "gap" => gap_params }) do
    employee = PixieCalendar.get_employee(employees_id)

    case PixieCalendar.insert_gap(map_gaps_params(gap_params))  do
      { :ok, _gap } -> redirect(conn, to: Routes.employees_gaps_path(conn, :index, employees_id))
      { :error, new_gap_changeset } -> render(conn, "new.html", %{ gap: new_gap_changeset, employee: employee })
    end
  end

  defp map_gaps_params(gap_params) do
    gap_params
    |> Map.update("start_date", gap_params["start_date"], fn date -> format_string_to_date(date) end)
    |> Map.update("end_date", gap_params["end_date"], fn date -> format_string_to_date(date) end)
  end

  defp format_string_to_date(%{ "year" => year, "month" => month, "day" => day }) do
    { _, date } = Timex.parse("#{year}-#{month}-#{day}", "{YYYY}-{0M}-{D}")
    date
  end
end
