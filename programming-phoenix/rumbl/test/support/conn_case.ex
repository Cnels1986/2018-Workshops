defmodule Rumbl.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Phoenix.ConnTest

      alias Rumbl.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import Rumbl.Router.Helpers
      import Rumbl.TestHelpers

      @endpoint Rumbl.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rumbl.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Rumbl.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
