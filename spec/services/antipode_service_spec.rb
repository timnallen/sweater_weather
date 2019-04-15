require 'rails_helper'

RSpec.describe GeocodingService do
  describe 'instance methods' do
    it '#find_lat_and_long' do
      location = 'hongkong'
    end

    it '#search_location_by_coordinates' do
      service = GeocodingService.new('https://maps.googleapis.com')
      coordinate_data = {data: {}}
      coordinate_data[:data][:attributes] = {
        lat: -22.0,
        long: -66.0
      }
      expect(service.search_location_by_coordinates(coordinate_data)).to eq('Santa Catalina')
    end
  end
end
