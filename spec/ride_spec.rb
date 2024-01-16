require "./lib/ride"

RSpec.describe Ride do
    before :each do
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    end

    it "exists" do
        expect(@ride1).to be_an_instance_of Ride
    end
end