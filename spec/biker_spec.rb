require "./lib/ride"
require "./lib/biker"

RSpec.describe Biker do
    before :each do
        @biker = Biker.new("Kenny", 30)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
        @biker2 = Biker.new("Athena", 15)
    end

    it "exists" do
        expect(@biker).to be_an_instance_of Biker
    end

    it "#learn_terrain!" do
        expect(@biker.acceptable_terrain).to eq([])

        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)

        expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end

    it "#log_ride" do
        expect(@biker.rides).to eq({})

        @biker.log_ride(@ride1, 92.5)
        @biker.log_ride(@ride1, 91.1)
        @biker.log_ride(@ride2, 60.9)
        @biker.log_ride(@ride2, 61.6)

        @biker2.log_ride(@ride1, 97.0)
        @biker2.log_ride(@ride2, 67.0)
        # biker2 doesn't have this terrain in acceptable_terrain yet, need to do #learn_terrain!
        
        expect(@biker.rides).to include(92.5)
        expect(@biker2.rides).to eq({})

        @biker2.learn_terrain!(:gravel)
        @biker2.learn_terrain!(:hills)
        @biker2.log_ride(@ride1, 95.0)
        @biker2.log_ride(@ride2, 65.0)

        expect(@biker2.rides).to include([65.0])
    end


end