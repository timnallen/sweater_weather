require 'rails_helper'

describe Antipode, type: :model do
  it 'it exists and has attributes' do
    geocoding_service = GeocodingService.new('https://maps.googleapis.com')
    search_location_coordinates = geocoding_service.find_lat_and_long('hongkong')
    amypode_service = AmypodeService.new('http://amypode.herokuapp.com')
    antipode_coordinate_data = amypode_service.get_antipode(search_location_coordinates)
    location_name = geocoding_service.search_location_by_coordinates(antipode_coordinate_data)
    dark_sky_service = DarkSkyService.new('https://api.darksky.net')
    forecast_data = dark_sky_service.get_forecast(antipode_coordinate_data)
    antipode = Antipode.new(antipode_coordinate_data, location_name, forecast_data, search_location_coordinates)
    expect(antipode).to be_a(Antipode)
    expect(antipode.location_name).to be_a(String)
    expect(antipode.search_location).to be_a(String)
    expect(antipode.forecast).to be_a(Hash)
    expect(antipode.forecast[:summary]).to be_a(String)
    expect(antipode.forecast[:current_temperature]).to be_a(Float)
  end
end
