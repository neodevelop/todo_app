defmodule TodoApp.Todos.Collaborator do
  use Ecto.Schema
  import Ecto.Changeset

  alias TodoApp.Todos.TodoList
  alias TodoApp.Accounts.User

  @message_alrady_exists "User already in Todo List"

  schema "collaborators" do
    belongs_to :user, User
    belongs_to :todo_list, TodoList
    timestamps()
  end

  def changeset(collaborator, attrs) do
    collaborator
    |> cast(attrs, [])
    |> validate_required([])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:todo_list_id)
    |> unique_constraint([:user, :todo_list],
      name: :collaborators,
      message: @message_alrady_exists
    )
  end
end
