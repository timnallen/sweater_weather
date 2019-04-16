require 'rails_helper'

RSpec.describe LocationFacade do
  describe 'instance methods' do
    it '#get_forecast_for_location' do
      location = 'denver,co'
      response = LocationFacade.new(location).get_forecast_for_location
      expect(response).to be_a(Forecast)
      expect(response.location).to include('Denver')
      expect(response.current_weather).to be_a(Hash)
    end
  end
end
