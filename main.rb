require_relative "map"
require_relative "generator"
require_relative "tool"
require_relative "const"
require_relative "order"

def show_main_menu
    puts "\nMain Menu"
    puts "0. Exit"
    puts "1. Show Map"
    puts "2. Order Food"
    puts "3. View History\n"
end

def read_input_from_text(filename, drivers_pos, stores)
    size=nil; user_posx=nil; user_posy=nil; num_drivers=nil; num_stores = nil;

    File.open(filename, "r") do |fh|
        while (line = fh.gets) != nil
            line = line.split(" ")
            if line[0] == "size"
                size = line[1].to_i 
            elsif line[0] == "user"
                user_posy, user_posx = line[1].to_i, line[2].to_i     
            elsif line[0] == "num_drivers"
                num_drivers = line[1].to_i
                while(line = fh.gets) != "end_drivers\n"
                    # DRIVER POSITION
                    line = line.split(",")
                    posy, posx = line[0].to_i, line[1].to_i
                    drivers_pos << Struct.new(:x, :y).new(posx, posy)
                end
            elsif line[0] == "stores"
                num_stores = line[1].to_i
                name = nil; menu = {}; posx = nil; posy = nil
                while(line = fh.gets) != "end\n"
                    line = line.split(" ")
                    if line[0] == "name"
                        name = line[1]
                    elsif line[0] == "menu"
                        key = line[1]
                        value = line[2].to_i
                        menu[key] = value
                    elsif line[0] == "position"
                        posy = line[1].to_i
                        posx = line[2].to_i
                    elsif line[0] == "end_store"
                        # Make store
                        store = Store.new(posx, posy, name, menu)
                        stores << store
                        name = nil; menu = {}; posy=nil; posx=nil
                    end
                end     
            end
        end
    end

    return size, user_posx, user_posy, num_drivers, num_stores
end

# Global Variable
map = nil

input = ARGV

case input.length
when 0
    map = Map.new
    Generator.generate_map(map)  
when 3
    size = input[0].to_i
    user_posx = input[1].to_i
    user_posy = input[2].to_i
    p "userPos (y,x) #{user_posy},#{user_posx}"
    map = Map.new(size)
    Generator.generate_map(map, drivers_position = nil, num_drivers = nil, num_store = nil, stores = nil, user_position = Struct.new(:x, :y).new(user_posx, user_posy))
when 1
    drivers_pos = []; stores = []
    size, user_posx, user_posy, num_drivers, num_stores = read_input_from_text( Const::INPUT_FILENAME, drivers_pos, stores)
    map = Map.new(size)
    Generator.generate_map(map, drivers_pos, num_drivers, num_stores, stores, user_position = Struct.new(:x, :y).new(user_posx, user_posy))
else
    raise "Param is not compatible"
end

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
        # Check whether if drivers empty. generate drivers
        if map.drivers_empty?
            puts "App is looking for drivers"
            Generator.generate_drivers(map)
        end

        Order.order_food(map)
        
        # DELETE BAD DRIVER
        Tool.delete_driver(map)
    
    when 3
        Order.view_order_history(Const::HISTORY_FILENAME)
    end
end
