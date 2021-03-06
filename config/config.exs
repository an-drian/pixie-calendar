# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pixie_calendar,
  ecto_repos: [PixieCalendar.Repo]

# Configures the endpoint
config :pixie_calendar, PixieCalendarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hK5mkTfO3Ikxf1H2QoX9yfkAtf1BoA+qQCn5pm7S/AzHf73O7Jhven8ak5PdnKyr",
  render_errors: [view: PixieCalendarWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PixieCalendar.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :pixie_calendar, :pow,
    user: PixieCalendar.Users.User,
    repo: PixieCalendar.Repo,
    web_module: PixieCalendarWeb,
    extensions: [PowPersistentSession],
    controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks
