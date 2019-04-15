require 'rails_helper'

RSpec.describe LocationService do
  describe 'class methods' do
    it '::get_forecast_for_location' do
      location = 'denver,co'
      response = LocationService.get_forecast_for_location(location)
      expect(response).to be_a(Hash)
      expect(response[:location]).to include('Denver')
      expect(response[:current_weather_info]).to be_a(Hash)
    end
  end
end
