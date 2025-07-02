defmodule BackendApiWeb.ResultJSON do
  alias BackendApi.Results.Result

  @doc """
  Renders a list of results.
  """
  def index(%{results: results}) do
    %{data: for(result <- results, do: data(result))}
  end

  @doc """
  Renders a single result.
  """
  def show(%{result: result}) do
    %{data: data(result)}
  end

  defp data(%Result{} = result) do
    %{
      id: result.id,
      coins_delta: result.coins_delta
    }
  end
end
