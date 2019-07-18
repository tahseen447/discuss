defmodule Discuss.User do
  use Discuss.Web, :model

  schema "users" do
    field :email, :string
    field :token, :string
    field :provider, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :token, :provider])
    |> validate_required([:email, :token, :provider])
  end
end
