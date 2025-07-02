defmodule BackendApiWeb.GameControllerTest do
  use BackendApiWeb.ConnCase

  import BackendApi.GamesFixtures

  alias BackendApi.Games.Game

  @create_attrs %{
    date: ~U[2025-07-01 19:10:00Z],
    notes: "some notes",
    buy_in: 42
  }
  @update_attrs %{
    date: ~U[2025-07-02 19:10:00Z],
    notes: "some updated notes",
    buy_in: 43
  }
  @invalid_attrs %{date: nil, notes: nil, buy_in: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get(conn, ~p"/api/games")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create game" do
    test "renders game when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/games", game: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/games/#{id}")

      assert %{
               "id" => ^id,
               "buy_in" => 42,
               "date" => "2025-07-01T19:10:00Z",
               "notes" => "some notes"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/games", game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update game" do
    setup [:create_game]

    test "renders game when data is valid", %{conn: conn, game: %Game{id: id} = game} do
      conn = put(conn, ~p"/api/games/#{game}", game: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/games/#{id}")

      assert %{
               "id" => ^id,
               "buy_in" => 43,
               "date" => "2025-07-02T19:10:00Z",
               "notes" => "some updated notes"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, game: game} do
      conn = put(conn, ~p"/api/games/#{game}", game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete game" do
    setup [:create_game]

    test "deletes chosen game", %{conn: conn, game: game} do
      conn = delete(conn, ~p"/api/games/#{game}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/games/#{game}")
      end
    end
  end

  defp create_game(_) do
    game = game_fixture()
    %{game: game}
  end
end
