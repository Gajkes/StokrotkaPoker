defmodule BackendApi.GamesTest do
  use BackendApi.DataCase

  alias BackendApi.Games

  describe "games" do
    alias BackendApi.Games.Game

    import BackendApi.GamesFixtures

    @invalid_attrs %{date: nil, notes: nil, buy_in: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{date: ~U[2025-07-01 19:10:00Z], notes: "some notes", buy_in: 42}

      assert {:ok, %Game{} = game} = Games.create_game(valid_attrs)
      assert game.date == ~U[2025-07-01 19:10:00Z]
      assert game.notes == "some notes"
      assert game.buy_in == 42
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{date: ~U[2025-07-02 19:10:00Z], notes: "some updated notes", buy_in: 43}

      assert {:ok, %Game{} = game} = Games.update_game(game, update_attrs)
      assert game.date == ~U[2025-07-02 19:10:00Z]
      assert game.notes == "some updated notes"
      assert game.buy_in == 43
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end
end
