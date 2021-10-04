defmodule TodoApp.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias TodoApp.Accounts.User
  alias TodoApp.Todos.TodoList

  schema "todos" do
    belongs_to :user, User
    belongs_to :todo_list, TodoList
    field :description, :string
    field :done, :boolean, default: false
    field :expiration, :naive_datetime

    timestamps()
  end

  @doc """
  Creates a changeset from a map with params for Todo

  ## Example

      iex> alias TodoApp.Todos.Todo
      iex> changeset = Todo.changeset(%Todo{}, %{"description" => "some description", "expiration" => "2021-12-12 00:00:00"})
      iex> changeset.errors
      []
      iex> changeset.changes
      %{description: "some description", expiration: ~N[2021-12-12 00:00:00]}
  """
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:description, :done, :expiration, :user_id, :todo_list_id])
    |> validate_required([:description, :done, :expiration])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:todo_list_id)
  end

  @doc false
  def changeset(_todo, :insert, _attrs) do
    # ...
  end

  @doc false
  def changeset(_todo, :update, _attrs) do
    # ...
  end
end
