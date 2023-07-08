defmodule RobotVizWeb.PageController do
  use RobotVizWeb, :controller

  def home(conn, _params) do
    game =
      Robot.run("""
      PLACE 1,6,WEST
      MOVE
      PLACE 3,3,EAST
      MOVE
      MOVE
      RIGHT
      MOVE
      REPORT
      """)

    render(conn, :home, game: game, layout: false)
  end
end
