class BikeClub
    attr_reader :name, :bikers
    
    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_biker(biker)
        @bikers << biker
    end

    def most_rides
        biker_with_most_rides = @bikers.max_by do |biker|
            biker.rides.values.flatten.length
        end
        biker_with_most_rides
    end

    # select method to create new array, lkasl;jgf;ljs;gj;
    def bikers_eligible(ride)
        @bikers.select do |biker|
            biker.eligible_for_ride?(ride)
        end
    end

    def best_time(ride)
        biker_with_best_time = @bikers.min_by do |biker|
            biker.personal_record(ride)
        end
        biker_with_best_time
    end

end