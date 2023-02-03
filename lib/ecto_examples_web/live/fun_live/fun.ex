defmodule EctoExamplesWeb.FunLive.Fun do
  use EctoExamplesWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    :ok = EctoExamplesWeb.Endpoint.subscribe("message_received", [])

    socket =
      socket
      |> assign(:messages, [])
      |> assign(:message, nil)
      |> assign(:having_fun?, false)
      |> assign(:show_assigns?, false)
      |> assign(:pid, self())

    {:ok, socket}
  end

  @impl true
  def handle_event("toggle_fun", payload, socket) do
    having_fun? = Map.get(payload, "value") == "on"
    {:noreply, assign(socket, :having_fun?, having_fun?)}
  end

  @impl true
  def handle_event("update_message", %{"message" => message}, socket) do
    {:noreply, assign(socket, :message, message)}
  end

  @impl true
  def handle_event("send_message", _, socket) do
    EctoExamplesWeb.Endpoint.broadcast(
      "message_received",
      "message_received",
      %{message: socket.assigns.message, from: self()}
    )

    {:noreply, assign(socket, :message, "")}
  end

  @impl true
  def handle_event("toggle_show_assigns", _, socket) do
    {:noreply, assign(socket, :show_assigns?, !socket.assigns.show_assigns?)}
  end

  @impl true
  def handle_info(%{topic: "message_received", payload: %{message: message, from: pid}}, socket) do
    sender = if pid == self(), do: "me: ", else: inspect(pid)
    new_messages = [{sender, message} | socket.assigns.messages] |> Enum.take(50)
    {:noreply, assign(socket, :messages, new_messages)}
  end
end
