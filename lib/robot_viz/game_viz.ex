defmodule RobotViz.GameViz do
  require Logger
  alias __MODULE__
  alias Robot.Game

  defstruct [:instructions, :index, :game]

  def new(instructions) do
    %GameViz{
      instructions: String.split(instructions, "\n"),
      index: 0,
      game: nil
    }
  end

  def step(%GameViz{} = game_viz) do
    %GameViz{index: index, instructions: instructions} = game_viz
    new_index = index + 1

    if new_index == length(instructions) do
      {:ok, :done}
    else
      instructions_str =
        Enum.take(instructions, index + 1)
        |> Enum.join("\n")

      case Robot.run(instructions_str) do
        %Game{} = game ->
          %GameViz{game_viz | index: new_index, game: game}
      end
    end
  end
end
