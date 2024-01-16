class Biker
    attr_reader :name, :max_distance, :rides, :acceptable_terrain  

    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrain = []
    end

    def learn_terrain!(terrain_type)
        @acceptable_terrain << terrain_type
    end

    def log_ride(ride, distance)
        if bikeable?(ride, distance)
            if @rides[ride].nil?
                @rides[ride] = []
            end
            @rides[ride] << distance
        end
    end

    def bikeable?(ride, distance)
        @acceptable_terrain.include?(ride.terrain) && distance <= @max_distance
    end

    def personal_record(ride)
        @rides.key?(ride)
        @rides[ride].max
    end

end