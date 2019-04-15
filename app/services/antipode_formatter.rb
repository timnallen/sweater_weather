class AntipodeFormatter
  def self.format(antipode_coordinate_data, location_name, forecast_data, search_location)
    antipode_coordinate_data[:attributes] = attributes_formatter(location_name, forecast_data)
    antipode_coordinate_data[:search_location] = coordinate_query.location_name
    return antipode_coordinate_data
  end

  private

  def attributes_formatter(location_name, forecast_data)
    binding.pry
  end
end
