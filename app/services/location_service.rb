class LocationService
  def self.get_forecast_for_location(location)
    coordinate_query = geocoding_service.find_lat_and_long(location)
    # send lat and long to darksky >>>> return json
  end

  private

  def self.geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end
end
