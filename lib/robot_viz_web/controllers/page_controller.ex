defmodule RobotVizWeb.PageController do
  use RobotVizWeb, :controller

  def home(conn, _params) do
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
    game = game_viz.game

    render(conn, :home, game: game, game_viz: game_viz, layout: false)
  end
end
