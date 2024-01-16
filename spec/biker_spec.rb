require "./lib/ride"
require "./lib/biker"

RSpec.describe Biker do
    before :each do
        @biker = Biker.new("Kenny", 30)
    end

    it "exists" do
        expect(@biker).to be_an_instance_of Biker
    end


end