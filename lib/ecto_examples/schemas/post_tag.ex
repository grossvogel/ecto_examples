defmodule EctoExamples.PostTag do
  @moduledoc """
  Data definition for the join table between posts and tags

  **NOTE:** you can make and manage many_to_many relationships _without_ ever
  creating a schema module for the join table, but you _do_ need the join
  table itself. If the join holds additional info (e.g. the "role" of a
  user on a team) then you would need a schema.
  """
  use Ecto.Schema

  alias EctoExamples.{Post, Tag}

  @primary_key false
  schema "posts_tags" do
    belongs_to :post, Post
    belongs_to :tag, Tag

    timestamps()
  end
end
