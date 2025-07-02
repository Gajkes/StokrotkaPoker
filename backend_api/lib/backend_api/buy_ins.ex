defmodule BackendApi.BuyIns do
  @moduledoc """
  The BuyIns context.
  """

  import Ecto.Query, warn: false
  alias BackendApi.Repo

  alias BackendApi.BuyIns.BuyIn

  @doc """
  Returns the list of buy_ins.

  ## Examples

      iex> list_buy_ins()
      [%BuyIn{}, ...]

  """
  def list_buy_ins do
    Repo.all(BuyIn)
  end

  @doc """
  Gets a single buy_in.

  Raises `Ecto.NoResultsError` if the Buy in does not exist.

  ## Examples

      iex> get_buy_in!(123)
      %BuyIn{}

      iex> get_buy_in!(456)
      ** (Ecto.NoResultsError)

  """
  def get_buy_in!(id), do: Repo.get!(BuyIn, id)

  @doc """
  Creates a buy_in.

  ## Examples

      iex> create_buy_in(%{field: value})
      {:ok, %BuyIn{}}

      iex> create_buy_in(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_buy_in(attrs \\ %{}) do
    %BuyIn{}
    |> BuyIn.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a buy_in.

  ## Examples

      iex> update_buy_in(buy_in, %{field: new_value})
      {:ok, %BuyIn{}}

      iex> update_buy_in(buy_in, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_buy_in(%BuyIn{} = buy_in, attrs) do
    buy_in
    |> BuyIn.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a buy_in.

  ## Examples

      iex> delete_buy_in(buy_in)
      {:ok, %BuyIn{}}

      iex> delete_buy_in(buy_in)
      {:error, %Ecto.Changeset{}}

  """
  def delete_buy_in(%BuyIn{} = buy_in) do
    Repo.delete(buy_in)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking buy_in changes.

  ## Examples

      iex> change_buy_in(buy_in)
      %Ecto.Changeset{data: %BuyIn{}}

  """
  def change_buy_in(%BuyIn{} = buy_in, attrs \\ %{}) do
    BuyIn.changeset(buy_in, attrs)
  end
end
