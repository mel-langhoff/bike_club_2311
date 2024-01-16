require "./lib/ride"
require "./lib/biker"
require "./lib/bike_club"

RSpec.describe BikeClub do
    before :each do
        @bikeclub = BikeClub.new("Bitchin Bike Club")
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
    end

    it "exists" do
        expect(@bikeclub).to be_an_instance_of BikeClub
    end

    it "#add_member" do
        @bikeclub.add_member(@biker)
        @bikeclub.add_member(@biker2)

        expect(@bikeclub.bikers).to eq([@biker, @biker2])
    end

end