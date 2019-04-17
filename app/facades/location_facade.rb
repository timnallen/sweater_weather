class LocationFacade
  def initialize(location)
    @location = geocoding_service.find_lat_and_long(location)
  end

  def get_forecast_for_location
    Rails.cache.fetch("forecast/#{location}", expires_in: 1.hour) do
      forecast_data = dark_sky_service.get_forecast
      Forecast.new(location, forecast_data)
    end
  end

  private

  attr_reader :location

  def geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def dark_sky_service
    DarkSkyService.new(location)
  end
end
