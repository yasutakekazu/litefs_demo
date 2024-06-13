defmodule LitefsDemo.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LitefsDemo.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> LitefsDemo.Comments.create_comment()

    comment
  end
end
