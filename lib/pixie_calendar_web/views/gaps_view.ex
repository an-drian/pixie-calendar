defmodule PixieCalendarWeb.GapsView do
  use PixieCalendarWeb, :view

  def current_date_touple do
    { Timex.now.year, Timex.now.month, Timex.now.month }
  end
end
