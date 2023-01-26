defmodule EctoExamples.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :text)

      timestamps()
    end

    create table(:posts) do
      add(:title, :text)
      add(:body, :text)
      add(:user_id, references(:users))

      timestamps()
    end

    create(index(:posts, [:user_id]))

    create table(:tags) do
      add(:name, :text)

      timestamps()
    end

    create(unique_index(:tags, [:name]))

    create table(:posts_tags, primary_key: false) do
      add(:post_id, references(:posts), primary_key: true)
      add(:tag_id, references(:tags), primary_key: true)

      timestamps()
    end

    create(index(:posts_tags, [:tag_id]))
  end
end
