require "rails_helper"

RSpec.feature "User can search for ten closests stations" do
  visit root_path

  fill_in "stations_locate", with: "80203"
  click_button "Locate"

  expect(current_path).to eq("/search?zip=80203")

  # Build out the Service and come back to test
  # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
  # And the stations should be limited to Electric and Propane
  # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
end
