class AntipodeFacade
  def initialize(search_location)
    @search_location = search_location
  end

  def get_antipode_data
    Antipode.new(antipode_coordinate_data, location_name, forecast_data, search_location_coordinates)
  end

  private

  attr_reader :search_location

  def forecast_data
    @forecast_data ||= dark_sky_service.get_forecast
  end

  def location_name
    @location_name ||= geocoding_service.search_location_by_coordinates(antipode_coordinate_data)
  end

  def antipode_coordinate_data
    @antipode_coordinate_data ||= amypode_service.get_antipode(search_location_coordinates)
  end

  def search_location_coordinates
    @search_location_coordinates ||= geocoding_service.find_lat_and_long(search_location)
  end

  def amypode_service
    AmypodeService.new('http://amypode.herokuapp.com')
  end

  def geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def dark_sky_service
    DarkSkyService.new(search_location_coordinates)
  end
end
