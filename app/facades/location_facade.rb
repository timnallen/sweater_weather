class LocationFacade
  def get_forecast_for_location(location)
    coordinate_query = geocoding_service.find_lat_and_long(location)
    forecast_data = dark_sky_service.get_forecast(coordinate_query)
    Forecast.new(coordinate_query, forecast_data)
  end

  private

  def geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def dark_sky_service
    DarkSkyService.new('https://api.darksky.net')
  end
end