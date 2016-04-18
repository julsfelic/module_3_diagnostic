class NrelService
  def initialize
    @_connection = Faraday.new("http://developer.nrel.gov")
    connection.params["api_key"] = ENV["NREL_API_KEY"]
  end

  def nearest_alt_fuel_station(params)
    parse(connection.get("/api/alt-fuel-stations/v1/nearest.json", params))
  end

  private

    def connection
      @_connection
    end

    def parse(response)
      (JSON.parse(response.body)).deep_symbolize_keys
    end
end
