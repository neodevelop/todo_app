defmodule TodoAppWeb.TodoLive.Index do
  use TodoAppWeb, :live_view

  def render(assigns) do
    ~L"""
    <h1>Todo List</h1>
    <h3><%= @message %></h3>
    <button phx-click="increment">Incrementar</button>
    <button phx-click="decrement">Decrementar</button>
    <h3><%= @counter %></h3>
    <ul>
      <%= for t <- @todos do %>
        <li>
          <div phx-click="toggle-done" phx-value-todo-id="<%= t.id %>">
            <%= t.description %>  <%= t.done %>
          </div>
        </li>
      <% end %>
    </ul>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(
        message: "Hello world",
        counter: 0,
        todos: TodoApp.Todos.list_todos()
      )

    {:ok, socket}
  end

  def handle_event("increment", _params, socket) do
    socket =
      socket
      |> assign(counter: socket.assigns.counter + 1)

    {:noreply, socket}
  end

  def handle_event("decrement", _params, socket) do
    socket =
      socket
      |> assign(counter: socket.assigns.counter - 1)

    {:noreply, socket}
  end

  def handle_event("toggle-done", %{"todo-id" => id}, socket) do
    todo =
      id
      |> TodoApp.Todos.get_todo!()
      |> TodoApp.Todos.update_todo(%{"done" => true})

    IO.inspect(todo)

    {:noreply, assign(socket, todos: TodoApp.Todos.list_todos())}
  end
end
