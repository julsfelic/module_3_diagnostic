require "rails_helper"

RSpec.feature "User can search for ten closests stations" do
  visit root_path

  fill_in "stations_locate", with: "80203"
  click_button "Locate"

  expect(current_path).to eq("/search?zip=80203")

  list = []
  list = find(".stations").all("li")
  expect(list.size).to eq(10)
  expect(list[0]).to have_content("ELEC")
  expect(list[0]).to have_content("800 Acoma St")
  expect(list[0]).to have_content("0.3117 mi")
  expect(list[0]).to have_content("UDR")
  expect(list[9]).to have_content("ELEC")
  expect(list[9]).to have_content("1286-1296 Stout St")
  expect(list[9]).to have_content("1.13847 mi")
  expect(list[0]).to have_content("PUBLIC STATIONS")

  list.each do |station|
    expect(station).to_not have_content("BD")
    expect(station).to_not have_content("CNG")
    expect(station).to_not have_content("E85")
    expect(station).to_not have_content("HY")
    expect(station).to_not have_content("LNG")
  end



  # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
end
