defmodule BackendApi.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BackendApi.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        buy_in: 42,
        date: ~U[2025-07-01 19:10:00Z],
        notes: "some notes"
      })
      |> BackendApi.Games.create_game()

    game
  end
end
