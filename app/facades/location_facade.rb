class LocationFacade
  def initialize(location)
    @coordinate_query = geocoding_service.find_lat_and_long(location)
  end

  def get_forecast_for_location
    forecast_data = dark_sky_service.get_forecast
    Forecast.new(coordinate_query, forecast_data)
  end

  private

  attr_reader :coordinate_query

  def geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def dark_sky_service
    DarkSkyService.new(coordinate_query)
  end
end
