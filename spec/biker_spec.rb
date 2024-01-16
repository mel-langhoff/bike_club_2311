require "./lib/ride"
require "./lib/biker"

RSpec.describe Biker do
    before :each do
        @biker = Biker.new("Kenny", 30)
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


end