class Antipode
  attr_reader :id,
              :location_name,
              :forecast,
              :search_location

  def initialize(antipode_coordinate_data, location_name, forecast_data, search_location_coordinates)
    @id = antipode_coordinate_data[:data][:id]
    @location_name = location_name
    @forecast = forecast_data(forecast_data)
    @search_location = search_location_coordinates.location_name
  end

  private

  def forecast_data(forecast_data)
    {
      summary: forecast_data[:currently][:summary],
      current_temperature: forecast_data[:currently][:temperature]
    }
  end
end
