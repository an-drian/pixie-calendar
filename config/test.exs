use Mix.Config

# Configure your database
config :pixie_calendar, PixieCalendar.Repo,
  username: "postgres",
  password: "postgres",
  database: "pixie_calendar_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pixie_calendar, PixieCalendarWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
