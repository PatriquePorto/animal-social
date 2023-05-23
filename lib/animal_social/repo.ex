defmodule AnimalSocial.Repo do
  use Ecto.Repo,
    otp_app: :animal_social,
    adapter: Ecto.Adapters.Postgres
end
