class AntipodeService < ApplicationService
  def self.get_antipode_data(search_location)
    geocoding_service.find_lat_and_long(search_location)
    # antipode_coordinate_data = amypode_service.get_antipode(search_location)
    location_name = # get the location name
    forecast_data = # get the forecast hash with summary and current temperature
    AntipodeFormatter.format(antipode_coordinate_data, location_name, forecast_data, search_location)
  end

  private

  def self.amypode_service
    AmypodeService.new('http://amypode.herokuapp.com')
  end

  def self.geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end
end
