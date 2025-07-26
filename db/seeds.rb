toppings = [
  'Pepperoni', 'Mushrooms', 'Sausage', 'Bell Peppers', 'Onions',
  'Black Olives', 'Cheese', 'Tomatoes', 'Spinach', 'Pineapple',
  'Ham', 'Bacon', 'Jalapeños', 'Anchovies', 'Garlic'
]

toppings.each do |topping_name|
  Topping.find_or_create_by(name: topping_name)
end

pizza_data = [
  {
    name: 'Margherita',
    toppings: [ 'Cheese', 'Tomatoes' ]
  },
  {
    name: 'Pepperoni',
    toppings: [ 'Pepperoni', 'Cheese' ]
  },
  {
    name: 'Supreme',
    toppings: [ 'Pepperoni', 'Sausage', 'Bell Peppers', 'Onions', 'Mushrooms', 'Cheese' ]
  },
  {
    name: 'Hawaiian',
    toppings: [ 'Ham', 'Pineapple', 'Cheese' ]
  },
  {
    name: 'Veggie Delight',
    toppings: [ 'Mushrooms', 'Bell Peppers', 'Onions', 'Black Olives', 'Tomatoes', 'Spinach', 'Cheese' ]
  }
]

pizza_data.each do |pizza_info|
  pizza = Pizza.find_or_create_by(name: pizza_info[:name])
  pizza_info[:toppings].each do |topping_name|
    topping = Topping.find_by(name: topping_name)
    if topping
      PizzaTopping.find_or_create_by(pizza: pizza, topping: topping)
    end
  end
end

puts "Created #{Topping.count} toppings and #{Pizza.count} pizzas"
puts "Created #{PizzaTopping.count} pizza-topping associations"
