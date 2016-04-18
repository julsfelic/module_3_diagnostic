class NrelService
  def initialize
    @_connection = faraday.new("http://developer.nrel.gov/api")
    connection.params["api_key"] = ENV["NREL_API_KEY"]
  end

  def nearest_alt_fuel_station(params)
    parse(connection.get("/alt-fuel-stations/v1/nearest.json"), params)
  end

  private

    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body)
    end
end
