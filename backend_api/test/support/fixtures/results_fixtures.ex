defmodule BackendApi.ResultsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BackendApi.Results` context.
  """

  @doc """
  Generate a result.
  """
  def result_fixture(attrs \\ %{}) do
    {:ok, result} =
      attrs
      |> Enum.into(%{
        coins_delta: 42
      })
      |> BackendApi.Results.create_result()

    result
  end
end
