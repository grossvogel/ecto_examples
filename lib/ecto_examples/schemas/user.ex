defmodule EctoExamples.User do
  @moduledoc """
  Data definition for blog posts
  """
  use Ecto.Schema

  alias EctoExamples.Post

  schema "users" do
    field :name, :string

    has_many :posts, Post

    timestamps()
  end
end
