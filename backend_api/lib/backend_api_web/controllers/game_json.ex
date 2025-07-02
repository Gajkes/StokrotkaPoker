defmodule BackendApiWeb.GameJSON do
  alias BackendApi.Games.Game

  @doc """
  Renders a list of games.
  """
  def index(%{games: games}) do
    %{data: for(game <- games, do: data(game))}
  end

  @doc """
  Renders a single game.
  """
  def show(%{game: game}) do
    %{data: data(game)}
  end

  defp data(%Game{} = game) do
    %{
      id: game.id,
      date: game.date,
      notes: game.notes,
      buy_in: game.buy_in
    }
  end
end
