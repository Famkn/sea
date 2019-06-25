module Tool
    extend self
    
    #POSITION TOOL

    def out_of_bound?(pos, size)
        out?(pos.x, size) || out?(pos.y, size)
    end

    def out?(pos, size)
        pos < 0 || pos >= size
    end
    
    def position_same?(src, dst)
        src.x == dst.x && src.y == dst.y
    end

    
    #DRIVER TOOL

    def delete_driver(map)
        # replace all driver with "."
        # puts "replace all driver with ."
        
        map.drivers.each do |driver|
            # puts "driver:#{driver.name}. position: #{driver.position.y},#{driver.position.x}. rating: #{driver.rating}. first_time: #{driver.first_time}"
            # puts "map this position: #{map.grid[driver.position.y][driver.position.x]}"
            map.grid[driver.position.y][driver.position.x] = "."
            # puts "after map this position: #{map.grid[driver.position.y][driver.position.x]}"
        end #{|driver| map.grid[driver.position.y][driver.position.x] = "."}
        # puts "map:"
        # map.print_map
    
        # delete bad driver
        map.drivers.delete_if { |driver| !driver.first_time && driver.rating < 3.0 } 
        
        # # generate good driver only
        map.drivers.each {|good_driver| map.grid[good_driver.position.y][good_driver.position.x] = good_driver.name} 
        # puts "generate good driver only. map:"
        # map.print_map
    end


    #COST TOOL

    def cost_of_menu(ordered_menu, menu)
        total = 0
        ordered_menu.each do |name, sum|
            total += menu[name] * sum 
        end
        total
    end
    
    def cost_of_delivery(distance_driver_store, distance_store_user, unit_cost)
        (distance_driver_store.length + distance_store_user.length - 2) * unit_cost
    end

    def cost_of_order(ordered_menu, menu, distance_driver_store, distance_store_user, unit_cost)
        cost_of_menu(ordered_menu, menu) + cost_of_delivery(distance_driver_store, distance_store_user, unit_cost)
    end


    # RATING TOOL

    def rating_out?(rating, minr, maxr)
        rating < minr || rating > maxr
    end


end

