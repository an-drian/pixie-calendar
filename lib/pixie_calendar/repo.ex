defmodule PixieCalendar.Repo do
  use Ecto.Repo,
    otp_app: :pixie_calendar,
    adapter: Ecto.Adapters.Postgres
end
