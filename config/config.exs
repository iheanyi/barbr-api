# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :barbr, Barbr.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "xZVeaGF1VQJFqki/uGC5pzFe2GurQN99oX6B1Qq1CuX161YYr5bkXDKRpluL5rod",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: Barbr.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Barbr",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET") || "sINpfwJtnlmsQ9vr0b3MemlvMhpmaQDkWdVHRE+2yeI4T5kS7a9ABU69TZSFFwh3",
  serializer: Barbr.GuardianSerializer
