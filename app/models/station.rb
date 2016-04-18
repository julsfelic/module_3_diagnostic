class Station
  attr_reader :name,
              :address,
              :city,
              :state,
              :hours,
              :type,
              :distance

  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @state = data[:state]
    @city = data[:city]
    @hours = data[:access_days_time]
    @type = data[:fuel_type_code]
    @distance = data[:distance]
  end

  def self.find_by(zip_code)
    service = NrelService.new
    data = service.nearest_alt_fuel_station(
      location: zip_code,
      radius: "6.0",
      fuel_type: "ELEC,LPG",
      limit: "10"
    )
    data[:fuel_stations].map do |station|
      new(station)
    end
  end
end
