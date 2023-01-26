defmodule EctoExamples.Tag do
  @moduledoc """
  Data definition for tags
  """
  use Ecto.Schema

  alias EctoExamples.{Post, PostTag}

  schema "tags" do
    field :name, :string

    many_to_many :posts, Post, join_through: PostTag

    timestamps()
  end
end
