defmodule EctoExamplesWeb.ComponentTestLive.Test do
  @moduledoc false

  use EctoExamplesWeb, :live_view

  import EctoExamplesWeb.ComponentTestLive.Components

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:a, 100)
      |> assign(:b, 100)
      |> assign(:c, 100)

    {:ok, socket}
  end

  @impl true
  def handle_event("increment_a", _, socket) do
    {:noreply, assign(socket, :a, socket.assigns.a + 1)}
  end

  @impl true
  def handle_event("increment_b", _, socket) do
    {:noreply, assign(socket, :b, socket.assigns.b + 1)}
  end

  @impl true
  def handle_event("increment_c", _, socket) do
    {:noreply, assign(socket, :c, socket.assigns.c + 1)}
  end
end
