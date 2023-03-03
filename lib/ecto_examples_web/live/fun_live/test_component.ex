defmodule EctoExamplesWeb.FunLive.TestComponent do
  use EctoExamplesWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok, assign_new(socket, :test_message, fn _ -> "" end)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h4>What you type here goes in component state</h4>
      <form phx-change="update_test" phx-target={@myself}>
        <input name="test_message" value={@test_message} />
      </form>
    </div>
    """
  end

  @impl true
  def handle_event("update_test", %{"test_message" => test_message}, socket) do
    {:noreply, assign(socket, :test_message, test_message)}
  end
end
