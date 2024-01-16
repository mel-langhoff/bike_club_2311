class Biker
    attr_reader :name, :max_distance, :rides, :acceptable_terrain  

    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = Hash.new { |hash, key| hash[key] = [] }
        @acceptable_terrain = []
    end

    def learn_terrain!(terrain_type)
        @acceptable_terrain << terrain_type
    end

    def log_ride(ride, distance)
        if bikeable?(ride, distance)
          @rides[ride] << distance
        end
    end

    def bikeable?(ride, distance)
        @acceptable_terrain.include?(ride.terrain) && @max_distance >= distance
    end


end