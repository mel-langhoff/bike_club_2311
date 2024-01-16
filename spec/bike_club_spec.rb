require "./lib/ride"
require "./lib/biker"
require "./lib/bike_club"

RSpec.describe BikeClub do
    before :each do
        @bikeclub = BikeClub.new("Bitchin Bike Club")
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    it "exists" do
        expect(@bikeclub).to be_an_instance_of BikeClub
    end

    it "#add_biker" do
        @bikeclub.add_biker(@biker)
        @bikeclub.add_biker(@biker2)

        expect(@bikeclub.bikers).to eq([@biker, @biker2])
    end

    it "#most_rides" do
        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)
        @biker.log_ride(@ride1, 92.5)
        @biker.log_ride(@ride1, 91.1)
        @biker.log_ride(@ride2, 60.9)
        @biker.log_ride(@ride2, 61.6)

        @biker2.learn_terrain!(:gravel)
        @biker2.learn_terrain!(:hills)
        @biker2.log_ride(@ride1, 95.0)
        @biker2.log_ride(@ride2, 65.0)

        @bikeclub.add_biker(@biker)
        @bikeclub.add_biker(@biker2)
        expect(@bikeclub.bikers).to eq([@biker, @biker2])

        expect(@bikeclub.most_rides).to eq(@biker)
    end



end