defmodule BackendApiWeb.ResultControllerTest do
  use BackendApiWeb.ConnCase

  import BackendApi.ResultsFixtures

  alias BackendApi.Results.Result

  @create_attrs %{
    coins_delta: 42
  }
  @update_attrs %{
    coins_delta: 43
  }
  @invalid_attrs %{coins_delta: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all results", %{conn: conn} do
      conn = get(conn, ~p"/api/results")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create result" do
    test "renders result when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/results", result: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/results/#{id}")

      assert %{
               "id" => ^id,
               "coins_delta" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/results", result: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update result" do
    setup [:create_result]

    test "renders result when data is valid", %{conn: conn, result: %Result{id: id} = result} do
      conn = put(conn, ~p"/api/results/#{result}", result: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/results/#{id}")

      assert %{
               "id" => ^id,
               "coins_delta" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, result: result} do
      conn = put(conn, ~p"/api/results/#{result}", result: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete result" do
    setup [:create_result]

    test "deletes chosen result", %{conn: conn, result: result} do
      conn = delete(conn, ~p"/api/results/#{result}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/results/#{result}")
      end
    end
  end

  defp create_result(_) do
    result = result_fixture()
    %{result: result}
  end
end
