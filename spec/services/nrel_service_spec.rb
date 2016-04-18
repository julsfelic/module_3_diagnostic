require "rails_helper"

RSpec.describe NrelService do
  context "#nearest_alt_fuel_station" do
    it "returns electric and propane fuel stations within a 6mi radius" do
      service = NrelService.new

      response = service.nearest_alt_fuel_station(location: "60073", radius: "6.0", fuel_type: "ELEC,LPG")

      expect(response[:total_results]).to eq(7)
      expect(response[:fuel_stations][0][:fuel_type_code]).to eq("LPG")
      expect(response[:fuel_stations][0][:id]).to eq(21207)
      expect(response[:fuel_stations][0][:city]).to eq("Lake Villa")
    end
  end
end
