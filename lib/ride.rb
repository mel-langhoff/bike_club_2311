class Ride
    attr_reader :name, :distance, :loop, :terrain

    def initialize(ride_data)
        @name = ride_data[:name]
        @distance = ride_data[:distance]
        @loop = ride_data[:loop]
        @terrain = ride_data[:terrain]
    end

    def loop?
        @loop
    end

    def total_distance
        if @loop
            @distance
        else
            2 * @distance
        end
    end

end