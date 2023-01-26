# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EctoExamples.Repo.insert!(%EctoExamples.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Ecto.Changeset
alias EctoExamples.{Repo, Post, PostTag, Tag, User}

create_user = fn ->
  %User{}
  |> Changeset.change(%{name: Faker.Person.name()})
  |> Repo.insert!()
end

create_tag = fn ->
  %Tag{}
  |> Changeset.change(%{name: Faker.StarWars.planet()})
  |> Repo.insert!()
end

create_post = fn users ->
  %Post{}
  |> Changeset.change(%{
    title: Faker.Aws.En.service(),
    body: Faker.Lorem.Shakespeare.hamlet(),
    user_id: users |> Enum.random() |> Map.get(:id)
  })
  |> Repo.insert!()
end

create_post_tag = fn posts, tags ->
  %PostTag{}
  |> Changeset.change(%{
    post_id: posts |> Enum.random() |> Map.get(:id),
    tag_id: tags |> Enum.random() |> Map.get(:id)
  })
  |> Repo.insert!()
end

#
# END HELPERS, BEGIN SCRIPT
#

tags = Enum.map(1..10, fn _i -> create_tag.() end)
users = Enum.map(1..10, fn _i -> create_user.() end)
posts = Enum.map(1..10, fn _i -> create_post.(users) end)
Enum.map(1..10, fn _i -> create_post_tag.(posts, tags) end)
