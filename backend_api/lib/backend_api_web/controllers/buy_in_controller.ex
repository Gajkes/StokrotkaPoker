defmodule BackendApiWeb.BuyInController do
  use BackendApiWeb, :controller

  alias BackendApi.BuyIns
  alias BackendApi.BuyIns.BuyIn

  action_fallback BackendApiWeb.FallbackController

  def index(conn, _params) do
    buy_ins = BuyIns.list_buy_ins()
    render(conn, :index, buy_ins: buy_ins)
  end

  def create(conn, %{"buy_in" => buy_in_params}) do
    with {:ok, %BuyIn{} = buy_in} <- BuyIns.create_buy_in(buy_in_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/buy_ins/#{buy_in}")
      |> render(:show, buy_in: buy_in)
    end
  end

  def show(conn, %{"id" => id}) do
    buy_in = BuyIns.get_buy_in!(id)
    render(conn, :show, buy_in: buy_in)
  end

  def update(conn, %{"id" => id, "buy_in" => buy_in_params}) do
    buy_in = BuyIns.get_buy_in!(id)

    with {:ok, %BuyIn{} = buy_in} <- BuyIns.update_buy_in(buy_in, buy_in_params) do
      render(conn, :show, buy_in: buy_in)
    end
  end

  def delete(conn, %{"id" => id}) do
    buy_in = BuyIns.get_buy_in!(id)

    with {:ok, %BuyIn{}} <- BuyIns.delete_buy_in(buy_in) do
      send_resp(conn, :no_content, "")
    end
  end
end
