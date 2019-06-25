require_relative "map"

require_relative "generator"
require_relative "finder"


# input = ARGV

# case input.length
# when 0
#     p "enol"
# when 1
#     p "satu"
# when 2
#     p "dua"
# end
map = Map.new(10)
Generator.generate_map(map)
map.print_map

driver = Finder.find_driver(map.drivers, map.stores[0])
p driver.name