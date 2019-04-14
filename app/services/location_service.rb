class LocationService
  def self.get_forecast_for_location(location)
    fetch_data(location)
  end

  private

  def self.fetch_data(location)
    coordinate_query = geocoding_service.find_lat_and_long(location)
    forecast_data = dark_sky_service.get_forecast(coordinate_query)
    package_data(coordinate_query, forecast_data)
  end

  def self.package_data(coordinate_query, forecast_data)
    location_formatter.format_location(coordinate_query, forecast_data)
  end

  def self.geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def self.dark_sky_service
    DarkSkyService.new('https://api.darksky.net')
  end

  def self.location_formatter
    LocationFormatter.new
  end
end
