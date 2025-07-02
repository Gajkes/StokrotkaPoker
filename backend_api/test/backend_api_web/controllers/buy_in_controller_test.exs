defmodule BackendApiWeb.BuyInControllerTest do
  use BackendApiWeb.ConnCase

  import BackendApi.BuyInsFixtures

  alias BackendApi.BuyIns.BuyIn

  @create_attrs %{
    amount_usd: 42,
    coins: 42
  }
  @update_attrs %{
    amount_usd: 43,
    coins: 43
  }
  @invalid_attrs %{amount_usd: nil, coins: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all buy_ins", %{conn: conn} do
      conn = get(conn, ~p"/api/buy_ins")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create buy_in" do
    test "renders buy_in when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/buy_ins", buy_in: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/buy_ins/#{id}")

      assert %{
               "id" => ^id,
               "amount_usd" => 42,
               "coins" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/buy_ins", buy_in: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update buy_in" do
    setup [:create_buy_in]

    test "renders buy_in when data is valid", %{conn: conn, buy_in: %BuyIn{id: id} = buy_in} do
      conn = put(conn, ~p"/api/buy_ins/#{buy_in}", buy_in: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/buy_ins/#{id}")

      assert %{
               "id" => ^id,
               "amount_usd" => 43,
               "coins" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, buy_in: buy_in} do
      conn = put(conn, ~p"/api/buy_ins/#{buy_in}", buy_in: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete buy_in" do
    setup [:create_buy_in]

    test "deletes chosen buy_in", %{conn: conn, buy_in: buy_in} do
      conn = delete(conn, ~p"/api/buy_ins/#{buy_in}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/buy_ins/#{buy_in}")
      end
    end
  end

  defp create_buy_in(_) do
    buy_in = buy_in_fixture()
    %{buy_in: buy_in}
  end
end
