defmodule Discuss.CommentsChannel do
  use Discuss.Web, :channel
  alias Discuss.{Topic, Comment}

  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Repo.get(Topic, topic_id)
  #comments = Repo.get(Topic, topic_id)
  #  |> Discuss.Repo.all(assoc(:comments))

    {:ok, %{}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => comment}, socket) do
    topic = socket.assigns.topic

    changeset = topic
    |> build_assoc(:comments)
    |> Comment.changeset(%{comment: comment})

    case Repo.insert(changeset) do
      {:ok, content} -> {:reply, :ok, socket}
      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end

  end

end
