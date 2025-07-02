defmodule BackendApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BackendApi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        nickname: "some nickname",
        phone: "some phone"
      })
      |> BackendApi.Accounts.create_user()

    user
  end
end
