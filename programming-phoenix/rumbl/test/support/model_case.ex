defmodule Rumbl.ModelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Rumbl.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Rumbl.TestHelpers
      import Rumbl.ModelCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rumbl.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Rumbl.Repo, {:shared, self()})
    end

    :ok
  end

  def errors_on(struct, data) do
    struct.__struct__.changeset(struct, data)
    |> Ecto.Changeset.traverse_errors(&Rumbl.ErrorHelpers.translate_error/1)
    |> Enum.flat_map(fn {key, errors} -> for msg <- errors, do: {key, msg} end)
  end
end
