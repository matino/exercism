defmodule Robot do
  defstruct x: 0, y: 0, direction: :north
end

defmodule RobotSimulator do

  @directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(), do: %Robot{}

  def create(direction, _) when direction not in @directions do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y}) when is_integer(x) and is_integer(y) do
    %Robot{x: x, y: y, direction: direction}
  end

  def create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, ""), do: robot

  def simulate(robot, "R" <> instructions) do
    robot |> turn_right |> simulate(instructions)
  end

  def simulate(robot, "L" <> instructions) do
    robot |> turn_left |> simulate(instructions)
  end

  def simulate(robot, "A" <> instructions) do
    robot |> move |> simulate(instructions)
  end

  def simulate(_, _), do: {:error, "invalid instruction"}

  defp turn_right(%Robot{direction: direction} = robot) do
    index = current_direction_index(direction)
    %Robot{robot | direction: Enum.at(@directions, rem(index + 1, 4))}
  end

  defp turn_left(%Robot{direction: direction} = robot) do
    index = current_direction_index(direction)
    %Robot{robot | direction: Enum.at(@directions, index - 1)}
  end

  defp current_direction_index(direction) do
    Enum.find_index(@directions, fn x -> x == direction end)
  end

  defp move(%Robot{x: x, y: y, direction: direction} = robot) do
    case direction do
      :north -> %Robot{robot | y: y + 1}
      :south -> %Robot{robot | y: y - 1}
      :east  -> %Robot{robot | x: x + 1}
      :west  -> %Robot{robot | x: x - 1}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%Robot{direction: direction}) do
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%Robot{x: x, y: y}) do
    {x, y}
  end
end
