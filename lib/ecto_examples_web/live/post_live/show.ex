defmodule EctoExamplesWeb.PostLive.Show do
  use EctoExamplesWeb, :live_view

  alias EctoExamples.{Posts, Repo}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    post = id |> Posts.get_post!() |> Repo.preload([:tags, :author])

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, post)}
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"
end
