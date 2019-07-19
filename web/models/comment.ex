defmodule Discuss.Comment do
  use Discuss.Web, :model

  schema "comments" do
    field :comment, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:comment] )
    |> validate_required([:comment])
  end
end
