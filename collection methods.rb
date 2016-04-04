class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Alfon´s place", "Madrid", 5, 42),
  Home.new("Mikel´s place", "Madrid", 8, 47),
  Home.new("Urtzi´s place", "Jaén", 7, 41),
  Home.new("Isa´s place", "Córdoba", 5, 45),
  Home.new("Alex's place", "Madrid", 6, 61),
  Home.new("Jorge's place", "Córdoba", 3, 49),
  Home.new("David's place", "Madrid", 2, 38),
  Home.new("Cecilia's place", "Granada", 4, 32),
  Home.new("Jose Mi's place", "Granada", 3, 44),
  Home.new("Maria's place", "Jaén", 8, 86)
]





def array_printer(array)
	array.each do |home|
		puts "#{home.name} in #{home.city}. It´s for #{home.capacity} people and it´s price is #{home.price}€."
	end
end



mapped_homes = homes.map do |home|
	home.price
end

puts "<=======================>"
#utilizando reduce method
total_price = mapped_homes.reduce(0.0) do |a, b|
	a + b
end


def sort_by_price(array)
	sorted_by_price = array.sort do |a, b|
		b.price <=> a.price
	end
	array_printer(sorted_by_price)
end


def sort_by_capacity(array)
	sorted_by_capacity = array.sort do |a, b|
		b.capacity <=> a.capacity
	end
	array_printer(sorted_by_capacity)
end

#average_price = total_price / (mapped_homes.length)
#puts average_price






puts "These are our available houses:"
array_printer(homes)




puts "I guess you want to sort our available Houses. Will you want me to do it by price or capacity?"
sort_value = gets.chomp


	if sort_value == "price"
		 puts "Sorted by price:"
		 sort_by_price(homes)	
	elsif sort_value == 'capacity'
	  puts "Sorted by capacity:"
	  sort_by_capacity(homes)	
	end
puts "========================================"
puts "========================================"

puts "Please select a city from the list above."
city = gets.chomp


 selected_city = homes.select do |home|
 	home.city == city
 end
 
 array_printer(selected_city)

puts "==============================================="


 total_from_selected_city = selected_city.reduce(0.00) do |sum, home|
 	sum + home.price
 end
 puts total_from_selected_city


average_from_selected_city = total_from_selected_city/(selected_city.length)

puts "The average price of the houses in #{city} is #{average_from_selected_city}€."


puts "Please enter an amount:"
amount = gets.chomp.to_f
home_by_amount = homes.find do |home|
	home.price == amount
end

#array_printer([home_by_amount])

puts "===================="
puts "For #{amount}€ you have #{home_by_amount.name} in #{home_by_amount.city}."






