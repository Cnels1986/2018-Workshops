defmodule Mix.Tasks.Count.Videos do
  use Mix.Task

  import Ecto.Query
  alias Rumbl.Repo
  alias Rumbl.Video

  @shortdoc "Counts number of videos by category"

  def run(_) do
    Mix.Task.run "app.start"
    comedy = Repo.one from u in Video,
      select: count(u.id),
      where: (u.category_id == 4)

    action = Repo.one from u in Video,
      select: count(u.id),
      where: (u.category_id == 1)

    romance = Repo.one from u in Video,
      select: count(u.id),
      where: (u.category_id == 3)

    drama = Repo.one from u in Video,
      select: count(u.id),
      where: (u.category_id == 2)

    scifi = Repo.one from u in Video,
      select: count(u.id),
      where: (u.category_id == 5)

    IO.puts "Comedy: #{comedy} videos"
    IO.puts  "Action: #{action} videos"
    IO.puts "Romance: #{romance} videos"
    IO.puts "Drama: #{drama} videos"
    IO.puts "Scifi: #{scifi} videos"
  end
end
