defmodule Discuss.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :provider, :string
      add :email, :string
      add :token, :string

      timestamps()
    end
  end
end
