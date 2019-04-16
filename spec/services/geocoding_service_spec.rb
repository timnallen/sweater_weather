require 'rails_helper'

RSpec.describe GeocodingService do
  describe 'instance methods' do
    before :each do
      @service = GeocodingService.new('https://maps.googleapis.com')
    end

    it '#find_lat_and_long' do
      location = 'hongkong'
      expect(@service.find_lat_and_long(location)).to be_a(CoordinateQuery)
      expect(@service.find_lat_and_long(location).query).to eq('hongkong')
    end

    it '#search_location_by_coordinates' do
      coordinate_data = {data: {}}
      coordinate_data[:data][:attributes] = {
        lat: -22.0,
        long: -66.0
      }
      expect(@service.search_location_by_coordinates(coordinate_data)).to eq('Ruta Provincial 5')
    end
  end
end
