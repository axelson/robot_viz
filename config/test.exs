import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :robot_viz, RobotVizWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "vvmaUmOuLCgDrmHf+Be+8zfzcgN6ZtD4dyV3+vQ+hFncb5M4O3fldKOzATTXPBYu",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
