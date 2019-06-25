def History
    attr_accessor :menu
    
    def initialize(store_name, ordered_menu, total_cost_order)
        @store_name = store_name
        @ordered_menu = ordered_menu
        @total_cost_order = total_cost_order
    end
end