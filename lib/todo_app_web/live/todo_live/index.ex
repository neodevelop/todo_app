defmodule TodoAppWeb.TodoLive.Index do
  use TodoAppWeb, :live_view

  def render(assigns) do
    ~L"""
    <h1>hola mundo</h1>
    <h2>Como estas?</h2>
    <h3><%= @message %></h3>
    <button phx-click="increment">Incrementar</button>
    <h3><%= @counter %></h3>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(message: "Hello world", counter: 0)

    {:ok, socket}
  end

  def handle_event("increment", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end
end
