class LocationService
  def self.get_forecast_for_location(location)
    coordinate_query = geocoding_service.find_lat_and_long(location)
    forecast_data = dark_sky_service.get_forecast(coordinate_query)
    location_formatter.format_location(coordinate_query, forecast_data)
  end

  private

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
