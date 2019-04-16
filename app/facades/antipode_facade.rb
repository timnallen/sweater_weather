class AntipodeFacade
  def get_antipode_data(search_location)
    search_location_coordinates = geocoding_service.find_lat_and_long(search_location)
    antipode_coordinate_data = amypode_service.get_antipode(search_location_coordinates)
    location_name = geocoding_service.search_location_by_coordinates(antipode_coordinate_data)
    forecast_data = dark_sky_service.get_forecast(antipode_coordinate_data)
    Antipode.new(antipode_coordinate_data, location_name, forecast_data, search_location)
  end

  private

  def amypode_service
    AmypodeService.new('http://amypode.herokuapp.com')
  end

  def geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def dark_sky_service
    DarkSkyService.new('https://api.darksky.net')
  end
end
