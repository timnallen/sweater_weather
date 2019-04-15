class AntipodeService < ApplicationService
  def self.get_antipode_data(search_location)
    coordinate_query = geocoding_service.find_lat_and_long(search_location)
    antipode_coordinate_data = amypode_service.get_antipode(coordinate_query)
    antipode_coordinate_query = geocoding_service.search_location_by_coordinates(antipode_coordinate_data)
    binding.pry
    forecast_data = dark_sky_service.get_forecast()# get the forecast hash with summary and current temperature
    AntipodeFormatter.format(antipode_coordinate_data, location_name, forecast_data, coordinate_query)
  end

  private

  def self.amypode_service
    AmypodeService.new('http://amypode.herokuapp.com')
  end

  def self.geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def self.dark_sky_service
    DarkSkyService.new('https://api.darksky.net')
  end
end
