require_relative "tool"

module Ui
    extend self

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
            puts "#{i+1}. Resto #{map.stores[i]} "
        end
        puts "Which one do you like to order?"
        resto = STDIN.gets.chomp.to_i
        resto -= 1
        while !resto.between?(0,stores_length-1)
            puts "Choose resto between 1 and #{stores_length}"
        end

        puts "Nice choice, here are the menus of Resto #{map.stores[resto]}"
        puts "Menu:"
        map.stores[resto].print_menu
        puts "Which one do you want?"
        puts "example: pizza 3"
        ordered_menu = {}
        add_item = "yes"
        while add_item == "yes"
            getting_order(map, ordered_menu)
            puts "would you like to add more items?(yes/(any other strings except yes considered no))"
            add_item = STDIN.gets.chomp()
        end
        # FINISH ORDER

    end

    def getting_order(map, ordered_menu)
        menu_name, menu_sum =  STDIN.gets.chomp.split(" ")
        while !map.stores[resto].menu.key?(menu_name) || menu_sum <= 0
            puts "#{menu_name} not available in this restaurant. please choose available item(s)" if !map.stores[resto].menu.key?(menu_name)
            puts "#{menu_sum} is not a right sum for your order. please choose the right sum for your order" if menu_sum <= 0 
            menu_name, menu_sum =  STDIN.gets.chomp.split(" ")
        end
        if !ordered_menu.key?(menu_name)
            ordered_menu[menu_name] = 0
        end
        ordered_menu[menu_name] += 1
    end

    def finish_order(map, ordered_menu)
        puts "Here's your menu"
        ordered_menu.each do |menu_name, menu_sum| 
           puts "#{menu_name} #{menu_sum} pcs" 
        end
        puts "Here's the total price"
        Tool.cost_of_order(ordered_menu, menu, distance_driver_store, distance_store_user)
    end

end