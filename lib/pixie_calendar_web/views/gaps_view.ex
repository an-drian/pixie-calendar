defmodule PixieCalendarWeb.GapsView do
  use PixieCalendarWeb, :view

  def current_date_touple do
    { Timex.now.year, Timex.now.month, Timex.now.day }
  end

  def duration(start_date, end_date) do
    Timex.diff(start_date, end_date, :days)
  end

  def humanize_date(date) do
    Timex.format!(date, "{YYYY}-{0M}-{D}")
  end
end
