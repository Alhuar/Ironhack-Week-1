class ShoppingCart

	def initialize(list_of_items)
		@cart = {}
		@list_of_items = list_of_items
	end

	def add_item_to_cart(item)
		if @cart[item] 
			@cart[item] += 1
		else
			@cart[item] = 1
		end
	
	end


	def total_price_by_fruit(price_per_unit, units)
		price_per_unit * units
	end
	
	def show_cart
		@cart.each do |fruit, quantity|
			total_of_cart = total_price_by_fruit(@list_of_items[fruit], @cart[fruit])
			puts " #{@cart[fruit]} #{fruit} #{total_of_cart}"
		end

	end

end


inventory = {
			:banana => 20,
			:apple => 10,
			:grape => 15,
			:orange => 5,
			:watermelon => 50
			}
shop = ShoppingCart.new(inventory)

shop.add_item_to_cart :banana
shop.add_item_to_cart :banana
shop.add_item_to_cart :apple 
shop.add_item_to_cart :watermelon
shop.show_cart




