defmodule EctoExamples.Post do
  @moduledoc """
  Data definition for blog posts
  """
  use Ecto.Schema

  alias EctoExamples.{PostTag, Tag, User}

  schema "posts" do
    field :title, :string
    field :body, :string

    many_to_many :tags, Tag, join_through: PostTag, on_replace: :delete
    belongs_to :author, User, foreign_key: :user_id

    timestamps()
  end
end
