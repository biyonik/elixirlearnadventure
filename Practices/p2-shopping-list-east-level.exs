# Practice - 2
# Easy Level
# Shopping List
# Scenario: "You are developing a shopping app, you need to manage the shopping list."
# Topics Learned: "List pattern matching, recursive functions, string interpolation"

defmodule ShoppingList do
  # Empty list control
  def list_status([]) do
    "Shopping list is empty! Please add a item."
  end

  def list_status([single_item]) do
    "This list have only single item: #{single_item}"
  end

  def list_status([first_item | rest]) do
    rest_count = length(rest)
    "First item is: #{first_item}, there are #{rest_count} more products."
  end

  def top_three_products([]) do
    "Shopping list is empty!"
  end

  def top_three_products([product]) do
    "Onyl: #{product}"
  end

  def top_three_products([a, b]) do
    "Top two: #{a}, #{b}"
  end

  def top_three_products([a, b, c | _rest]) do
    "Top three: #{a}, #{b}, #{c}"
  end

  # Recursive list print
  def toList([]) do
    IO.puts("--- End of list ---")
  end

  def toList([product | rest]) do
    IO.puts("- #{product}")
    toList(rest)
  end
end

shopping_list = ["Bread", "Milk", "Egg", "Cheese", "Tomato"]

IO.puts(ShoppingList.list_status(shopping_list))
IO.puts(ShoppingList.top_three_products(shopping_list))

IO.puts("\nFull List: ")
IO.puts(ShoppingList.toList(shopping_list))
