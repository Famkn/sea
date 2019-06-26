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

