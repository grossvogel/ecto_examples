defmodule EctoExamplesWeb.PageController do
  use EctoExamplesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
