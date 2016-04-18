class Station
  attr_reader :name,
              :address,
              :hours,
              :type,
              :distance

  def initialize(data)
    @name = data..
    @address = data
    @hours = data..hours
    @type = data..type
    @distance = data..distance
  end

  def self.find_by(zip_code)
    service = NrelService.new
    data = service.nearest_alt_fuel_station(
      location: zip_code,
      radius: "6.0",
      fuel_type: "ELEC,LPG",
      limit: "10"
    )
binding.pry
  end
end
