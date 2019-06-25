require_relative "map"
require_relative "generator"
# require_relative "finder"
require_relative "tool"
require_relative "const"
require_relative "order"
require_relative "history"

def show_main_menu
    puts "Main Menu"
    puts "0. Exit"
    puts "1. Show Map"
    puts "2. Order Food"
    puts "3. View History"
end

def save_history

end

def view_history(filename)

    File.open(filename, "r") do |f|
        f.each_line do |line|
            puts line
        end
    end
 
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
histories = []

map = Map.new(10)
Generator.generate_map(map)
while true
    show_main_menu
    puts "Which one do you like to use?"
    command = STDIN.gets.chomp.to_i
    case command
    when 0
        break
    when 1
        map.print_map

    when 2
        Order.order_food(map)
        
        # DELETE BAD DRIVER
        Tool.delete_driver(map)
        
        
        # Check whether if drivers empty. generate drivers
        if map.drivers_empty?
            puts "App is looking for drivers"
            Generator.generate_drivers(map)
        end

    when 3
        Order.view_order_history(Const::FILENAME)
    end
end
