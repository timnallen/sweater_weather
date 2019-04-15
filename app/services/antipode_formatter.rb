class AntipodeFormatter
  def self.format(antipode_coordinate_data, location_name, forecast_data, search_location)
    antipode_coordinate_data[:data][:attributes] = attributes_formatter(location_name, forecast_data)
    antipode_coordinate_data[:data][:search_location] = search_location.location_name
    antipode_coordinate_data[:data] = [antipode_coordinate_data[:data]]
    return antipode_coordinate_data
  end

  private

  def self.attributes_formatter(location_name, forecast_data)
    {
      location_name: location_name,
      forecast: forecast_formatter(forecast_data)
    }
  end

  def self.forecast_formatter(data)
    {
      summary: data[:currently][:summary],
      current_temperature: data[:currently][:temperature]
    }
  end
end
