require_relative "map"
require_relative "generator"
require_relative "finder"
require_relative "tool"
require_relative "const"

def show_main_menu
    puts "Main Menu"
    puts "0. Exit"
    puts "1. Show Map"
    puts "2. Order Food"
    puts "3. View History"
end

def order_food(map)
    stores_length = map.stores.length 
    puts "We have #{stores_length} stores"
    for i in 0...stores_length
        puts "#{i+1}. Resto #{map.stores[i].name} "
    end
    puts "Which one do you like to order?"
    store_choosed = STDIN.gets.chomp.to_i
    store_choosed -= 1
    while !store_choosed.between?(0,stores_length-1)
        puts "Choose stored between 1 and #{stores_length}"
    end
    store = map.stores[store_choosed]
    puts "Nice choice, here are the menus of Store #{store.name}"
    puts "Menu:"
    store.print_menu
    ordered_menu = {}
    add_item = "yes"
    while add_item == "yes"
        puts "Which one do you want?"
        puts "example: pizza 3"
        getting_order(map, ordered_menu, store)
        puts "would you like to add more items?(yes/(any other strings except yes considered no))"
        add_item = STDIN.gets.chomp()
    end


    # FINISH ORDER
    
    # Cost of Delivery
    # Find the nearest driver
    driver = Finder.find_driver(map.drivers, store)

    # cost from driver to store
    driver_position_x, driver_position_y = driver.position.x, driver.position.y 
    puts "original driver position: #{driver.position.y},#{driver.position.x}"
    path_driver_to_store = []
    Generator.generate_path(driver.position, store.position, path_driver_to_store)
    driver.position.x, driver.position.y = driver_position_x, driver_position_y 
    puts "after generate driver position: #{driver.position.y},#{driver.position.x}"

    
    # cost from store to user
    store_position_x, store_position_y = store.position.x, store.position.y
    puts "original store position: #{store.position.y},#{store.position.x}"
    path_store_to_user = []
    Generator.generate_path(store.position, map.user.position, path_store_to_user)
    store.position.x, store.position.y = store_position_x, store_position_y
    puts "after generate store position: #{store.position.y},#{store.position.x}"

    # compute total cost of order 
    cost = Tool.cost_of_order(ordered_menu, store.menu, path_driver_to_store, path_store_to_user, Const::UNITCOST) 

    puts "Here's your menu"
    ordered_menu.each do |menu_name, menu_sum| 
       puts "#{menu_name}. #{menu_sum} pcs" 
    end
    puts "Here's the total price: #{cost}"


    # PRINT THE ROUTE

    # ROUTE FROM DRIVER TO STORE

    length_driver_to_store = path_driver_to_store.length
    for i in 0...length_driver_to_store
        if i == 0
            puts "Driver is on the way to store. start at (#{path_driver_to_store[i].y},#{path_driver_to_store[i].x})"
        elsif i == length_driver_to_store-1  
            puts "go to (#{path_driver_to_store[i].y},#{path_driver_to_store[i].x}), driver arrived at the store"
        else
            puts "go to (#{path_driver_to_store[i].y},#{path_driver_to_store[i].x})"
        end
    end

    # ROUTE FROM STORE TO USER

    length_store_to_user = path_store_to_user.length
    for i in 0...length_store_to_user
        if i == 0
            puts "driver has bought the item(s), start at (#{path_store_to_user[i].y},#{path_store_to_user[i].x})"
        elsif i == length_store_to_user-1
            puts "go to (#{path_store_to_user[i].y},#{path_store_to_user[i].x}), driver arrived at your place!"
        else
            puts "go to (#{path_store_to_user[i].y},#{path_store_to_user[i].x})"
        end
    end

    
    # USER GIVE RATING TO DRIVER

    give_rating(map, driver)
    
end

def getting_order(map, ordered_menu, store)
    menu_name, menu_sum =  STDIN.gets.chomp.split(" ")
    menu_sum = menu_sum.to_i
    while !store.menu.key?(menu_name) || menu_sum <= 0
        puts "#{menu_name} not available in this store. please choose available item(s)" if !store.menu.key?(menu_name)
        puts "#{menu_sum} is not a right sum for your order. please choose the right sum for your order" if menu_sum <= 0 
        menu_name, menu_sum =  STDIN.gets.chomp.split(" ")
        menu_sum = menu_sum.to_i
    end
    if !ordered_menu.key?(menu_name)
        ordered_menu[menu_name] = 0
    end
    ordered_menu[menu_name] += menu_sum
end

def give_rating(map, driver)
    puts "please, give the driver a rating (#{Const::MINIMUM_RATING} to #{Const::MAXIMUM_RATING})"
    rating = STDIN.gets.chomp.to_i
    while Tool.rating_out?(rating, Const::MINIMUM_RATING, Const::MAXIMUM_RATING)
        puts "#{rating} is not a valid rating, please give a valid rating"
        rating = STDIN.gets.chomp.to_i
    end

    if driver.first_time
        driver.first_time = false
        driver.total_trip += 1
        driver.rating = rating
    else
        total_point = driver.rating * driver.total_trip
        driver.total_trip += 1
        driver.rating = (total_point + rating) / driver.total_trip.to_f 
    end
    puts "rating driver: #{driver.name} is now #{driver.rating}"
    
end

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
while true
    show_main_menu
    puts "Which one do you like to order?"
    command = STDIN.gets.chomp.to_i
    case command
    when 0
        break
    when 1
        map.print_map

    when 2
        order_food(map)
        # DELETE BAD DRIVER
        # puts "DELETE BAD DRIVER"
        Tool.delete_driver(map)
        # puts "AFTERDELETE BAD DRIVER"
        # map.drivers.each do |driver|
        #     puts "driver: #{driver.name} have rating:#{driver.rating}. first_time?:#{driver.first_time}"
        # end
        # map.print_map
        # Check whether if drivers empty. generate drivers
        if map.drivers_empty?
            puts "App is looking for drivers"
            Generator.generate_drivers(map)
        end
    end
end
