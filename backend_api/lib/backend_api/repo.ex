defmodule BackendApi.Repo do
  use Ecto.Repo,
    otp_app: :backend_api,
    adapter: Ecto.Adapters.Postgres
end
