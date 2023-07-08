defmodule RobotVizWeb.Board do
  use Phoenix.Component

  def board(assigns) do
    ~H"""
    <table>
      <%= for y <- 4..0 do %>
        <tr>
          <%= for x <- 0..4 do %>
            <td class="bg-slate-200 border-gray-600 border w-16 h-16">
              <%= if @game.robot_position == {x, y} do %>
                <%= robot(@game.robot_facing) %>
              <% else %>
                <%= x %>, <%= y %>
              <% end %>
            </td>
          <% end %>
        </tr>
      <% end %>
    </table>
    """
  end

  def reports(assigns) do
    ~H"""
    <%= for report <- @game.reports do %>
      <div><%= report %></div>
    <% end %>
    """
  end

  def robot(:north), do: "^"
  def robot(:east), do: ">"
  def robot(:south), do: "v"
  def robot(:west), do: "<"
end
