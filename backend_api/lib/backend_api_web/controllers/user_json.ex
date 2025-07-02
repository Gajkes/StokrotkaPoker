defmodule BackendApiWeb.UserJSON do
  alias BackendApi.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      nickname: user.nickname,
      phone: user.phone
    }
  end

  def leaderboard(%{users: users}) do
    %{data: Enum.map(users, &leaderboard_entry/1)}
  end

  defp leaderboard_entry(user) do
    %{
      id: user.id,
      nickname: user.nickname,
      total_coins: user.total_coins
    }
  end

end
