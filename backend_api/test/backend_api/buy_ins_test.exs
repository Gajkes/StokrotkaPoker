defmodule BackendApi.BuyInsTest do
  use BackendApi.DataCase

  alias BackendApi.BuyIns

  describe "buy_ins" do
    alias BackendApi.BuyIns.BuyIn

    import BackendApi.BuyInsFixtures

    @invalid_attrs %{amount_usd: nil, coins: nil}

    test "list_buy_ins/0 returns all buy_ins" do
      buy_in = buy_in_fixture()
      assert BuyIns.list_buy_ins() == [buy_in]
    end

    test "get_buy_in!/1 returns the buy_in with given id" do
      buy_in = buy_in_fixture()
      assert BuyIns.get_buy_in!(buy_in.id) == buy_in
    end

    test "create_buy_in/1 with valid data creates a buy_in" do
      valid_attrs = %{amount_usd: 42, coins: 42}

      assert {:ok, %BuyIn{} = buy_in} = BuyIns.create_buy_in(valid_attrs)
      assert buy_in.amount_usd == 42
      assert buy_in.coins == 42
    end

    test "create_buy_in/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BuyIns.create_buy_in(@invalid_attrs)
    end

    test "update_buy_in/2 with valid data updates the buy_in" do
      buy_in = buy_in_fixture()
      update_attrs = %{amount_usd: 43, coins: 43}

      assert {:ok, %BuyIn{} = buy_in} = BuyIns.update_buy_in(buy_in, update_attrs)
      assert buy_in.amount_usd == 43
      assert buy_in.coins == 43
    end

    test "update_buy_in/2 with invalid data returns error changeset" do
      buy_in = buy_in_fixture()
      assert {:error, %Ecto.Changeset{}} = BuyIns.update_buy_in(buy_in, @invalid_attrs)
      assert buy_in == BuyIns.get_buy_in!(buy_in.id)
    end

    test "delete_buy_in/1 deletes the buy_in" do
      buy_in = buy_in_fixture()
      assert {:ok, %BuyIn{}} = BuyIns.delete_buy_in(buy_in)
      assert_raise Ecto.NoResultsError, fn -> BuyIns.get_buy_in!(buy_in.id) end
    end

    test "change_buy_in/1 returns a buy_in changeset" do
      buy_in = buy_in_fixture()
      assert %Ecto.Changeset{} = BuyIns.change_buy_in(buy_in)
    end
  end
end
