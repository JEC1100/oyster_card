require 'station'

describe Station do
  let(:station) { Station.new }

    it "Given station name set when require name then return name" do
        station.name("bank")
        expect(station.station_name).to eq("bank")
    end

    it "Given station zone set when require zone then return zone" do
        station.zone(2)
        expect(station.station_zone).to eq(2)
    end
end