# Practice - 1
# Easy Level
# Coordinate System
# Scenario: "You are developing a 2D game, you need to manage character positions."
# Topics Learned: "Tuple pattern matching, guards, mathematical operations"


defmodule CoordinateSystem do
  def position_analysis(coordinate) do
    case coordinate do
      {0, 0} ->
        "Başlangıç noktasında (origin)"

      {x, 0} when x > 0 ->
        "Pozitif x ekseninde: #{x} birim sağda."

      {x, 0} when x < 0 ->
        "Negatif x ekseninde: #{abs(x)} birim solda."

      {0, y} when y > 0 ->
        "Pozitif y ekseninde: #{y} birim yukarıda."

      {0, y} when y < 0 ->
        "Negatif y ekseninde: #{abs(y)} birim aşağıda."

      {x, y} when x > 0 and y > 0 ->
        "1. bölgede: #{x}, #{y}"

      {x, y} when x < 0 and y > 0 ->
        "2. bölgede: #{x}, #{y}"

      {x, y} when x < 0 and y < 0 ->
        "3. bölgede: #{x}, #{y}"

      {x, y} when x > 0 and y < 0 ->
        "4. bölgede: #{x}, #{y}"
    end
  end

  def calculate_distance({x1, y1}, {x2, y2}) do
    dx = x2 - x1
    dy = y2 - y1
    :math.sqrt(dx * dx + dy * dy)
  end
end


# Test
IO.puts(CoordinateSystem.position_analysis({0, 0}))
IO.puts(CoordinateSystem.position_analysis({5, 0}))
IO.puts(CoordinateSystem.position_analysis({-3, 4}))

distance = CoordinateSystem.calculate_distance({0, 0}, {3, 4})
IO.puts("Distance: #{distance}")
