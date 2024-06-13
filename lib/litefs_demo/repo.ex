defmodule LitefsDemo.Repo do
  use Ecto.Repo,
    otp_app: :litefs_demo,
    adapter: Ecto.Adapters.SQLite3
end
