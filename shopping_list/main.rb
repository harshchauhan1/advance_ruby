

require 'shopping_list'
sl = ShoppingList.new
sl.item { |i| i.name("Toothpaste"); i.quantity(3) }
sl.item { |i| i.name("Computer"); i.quantity(1) }

puts sl   # should print the items and their quantities