require_relative "map"
require_relative "generator"
require_relative "finder"
require_relative "tool"
require_relative "const"

# def show_main_menu
#     puts "Main Menu"
#     puts "0. Exit"
#     puts "1. Show Map"
#     puts "2. Order Food"
#     puts "3. View History"
# end

# def order_food(map)
#     stores_length = map.stores.length 
#     puts "We have #{stores_length} stores"
#     for i in 0...stores_length
#         puts "#{i+1}. Resto #{map.stores[i]} "
#     end
#     puts "Which one do you like to order?"
#     resto = STDIN.gets.chomp.to_i
#     resto -= 1
#     while !resto.between?(0,stores_length-1)
#         puts "Choose resto between 1 and #{stores_length}"
#     end

#     puts "Nice choice, here are the menus of Resto #{map.stores[resto]}"
#     puts "Menu:"
#     map.stores[resto].print_menu
#     puts "Which one do you want?"
#     puts "example: pizza 3"
#     ordered_menu = {}
#     add_item = "yes"
#     while add_item == "yes"
#         getting_order(map, ordered_menu)
#         puts "would you like to add more items?(yes/(any other strings except yes considered no))"
#         add_item = STDIN.gets.chomp()
#     end
#     # FINISH ORDER
    
#     # Cost of Delivery
#     # Find the nearest driver
#     driver = Finder.find_driver(map.drivers, store)

#     # cost from driver to store
#     path_driver_to_store = []
#     generate_path(driver.position, store.position, path_driver_to_store)

#     # cost from store to user
#     path_store_to_user = []
#     generate_path(store.position, map.user.position, path_store_to_user)
    
#     # compute total cost of order 
#     cost = Tool.cost_of_order(ordered_menu, map.stores[resto].menu, path_driver_to_store, path_store_to_user, Const::UNITCOST) 

#     puts "Here's your menu"
#     ordered_menu.each do |menu_name, menu_sum| 
#        puts "#{menu_name}. #{menu_sum} pcs" 
#     end
#     puts "Here's the total price: #{cost}"


#     # PRINT THE ROUTE
#     # ROUTE FROM DRIVER TO STORE
#     length_driver_to_store = path_driver_to_store.length
#     for i in 0...length_driver_to_store
#         if i == 0
#             puts "Driver is on the way to store. start at (#{path_driver_to_store[i].y},#{path_driver_to_store[i].x})"
#         elsif i == length_driver_to_store-1  
#             puts "go to (#{path_driver_to_store[i].y},#{path_driver_to_store[i].x}), driver arrived at the store"
#         else
#             puts "go to (#{path_driver_to_store[i].y},#{path_driver_to_store[i].x})"
#         end
#     end

#     # ROUTE FROM STORE TO USER

#     length_store_to_user = path_store_to_user.length
#     for i in 0...length_store_to_user
#         if i == 0
#             puts "driver has bought the item(s), start at (#{path_store_to_user[i].y},#{path_store_to_user[i].x})"
#         elsif i == length_store_to_user-1
#             puts "go to (#{path_store_to_user[i].y},#{path_store_to_user[i].x}, driver arrived at your place!"
#         else
#             puts "go to (#{path_store_to_user[i].y},#{path_store_to_user[i].x}"
#     end
# end

# def getting_order(map, ordered_menu)
#     menu_name, menu_sum =  STDIN.gets.chomp.split(" ")
#     while !map.stores[resto].menu.key?(menu_name) || menu_sum <= 0
#         puts "#{menu_name} not available in this restaurant. please choose available item(s)" if !map.stores[resto].menu.key?(menu_name)
#         puts "#{menu_sum} is not a right sum for your order. please choose the right sum for your order" if menu_sum <= 0 
#         menu_name, menu_sum =  STDIN.gets.chomp.split(" ")
#     end
#     if !ordered_menu.key?(menu_name)
#         ordered_menu[menu_name] = 0
#     end
#     ordered_menu[menu_name] += 1
# end

# def give_rating(map, driver)
#     puts "please, give the driver a rating (#{Const::MINIMUM_RATING} to #{Const::MAXIMUM_RATING})"
#     rating = STDIN.gets.chomp.to_i
#     if !Tool.rating_out?(rating, Const::MINIMUM_RATING, Const::MAXIMUM_RATING)
#         puts "#{rating} is not a valid rating, please give a valid rating "
#         give_rating(map, driver)
#     else
        
#     end
# end
# def finish_order(map, ordered_menu)
#     puts "Here's your menu"
#     ordered_menu.each do |menu_name, menu_sum| 
#        puts "#{menu_name} #{menu_sum} pcs" 
#     end
#     puts "Here's the total price"
#     # Cost of Delivery
#     generate_path
#     Tool.cost_of_order(ordered_menu, menu, distance_driver_store, distance_store_user)
# end

# input = ARGV

# case input.length
# when 0
#     puts "enol"    
# when 3
#     puts "tiga"
# when 1
#     puts "satu"
# else
#     raise "Param is not compatible"
# end
#     p "satu"
# when 2
#     p "dua"
# end
map = Map.new(10)
Generator.generate_map(map)
map.print_map
p map.stores[1].menu.length
map.stores[1].print_menu