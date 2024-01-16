class BikeClub
    attr_reader :name, :bikers
    
    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_member(biker)
        @bikers << biker
    end

end