use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :barbr, Barbr.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :barbr, Barbr.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "barbr_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

  config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Barbr",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "testkey",
  serializer: Barbr.GuardianSerializer

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
