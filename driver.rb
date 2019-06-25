class Driver
    attr_accessor :position, :name, :rating, :first_time
    
    def initialize(posx, posy, name, rating, first_time)
        @position = Struct.new(:x, :y).new(posx, posy)
        @name = name
        @rating = rating
        @first_time = first_time
    end

end

# puts "hello world"

# map = x = Array.new(5) { Array.new(3){"."} }
# puts map

# puts rand(10...42).class # => 13

# puts rand(10)

# public int getRandomWithExclusion(Random rnd, int start, int end, int... exclude) {
#     int random = start + rnd.nextInt(end - start + 1 - exclude.length);
#     for (int ex : exclude) {
#         if (random < ex) {
#             break;
#         }
#         random++;
#     }
#     return random;
# }


# def getRandomWithExclusion(start, finish, exclude)
#     random = start + rand(finish - start - exclude.size)
#     exclude.each do |num|
#         if random < num 
#             break
#         end
#         random += 1
#     end
#     random
# end
