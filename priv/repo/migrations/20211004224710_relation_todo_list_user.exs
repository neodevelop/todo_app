defmodule TodoApp.Repo.Migrations.RelationTodoListUser do
  use Ecto.Migration

  def up do
    create table(:collaborators) do
      # create table(:todos_lists_users) do
      add(:todo_list_id, references(:todos_lists, on_delete: :nothing))
      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(unique_index(:collaborators, [:todo_list_id, :user_id]))
  end

  def down do
    #  drop(table(:todo_lists_users))
    drop(table(:collaborators))
  end
end
