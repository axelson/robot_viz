defmodule RobotVizWeb.GameLive do
  use RobotVizWeb, :live_view
  require Logger

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    instructions = """
    PLACE 1,6,WEST
    MOVE
    PLACE 3,3,EAST
    MOVE
    MOVE
    RIGHT
    MOVE
    REPORT
    """

    game_viz = RobotViz.GameViz.new(instructions)

    socket = assign(socket, game_viz: game_viz)

    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("step", _params, socket) do
    %{game_viz: game_viz} = socket.assigns
    game_viz = RobotViz.GameViz.step(game_viz)
    socket = assign(socket, game_viz: game_viz)
    {:noreply, socket}
  end

  def handle_event(event, _params, socket) do
    Logger.debug("Ignoring unhandled event: #{inspect(event)}")
    {:noreply, socket}
  end
end
