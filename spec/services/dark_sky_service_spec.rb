require 'rails_helper'

RSpec.describe DarkSkyService do
  describe 'instance methods' do
    before :each do
      @coordinate_data = {
        data: {
          id: '1',
          type: 'antipode',
          attributes: {
            lat: -22.0,
            long: -66.0
          }
        }
      }
      @service = DarkSkyService.new(@coordinate_data)
    end

    it '#get_forecast' do
      @coordinate_data = {
        data: {
          id: '1',
          type: 'antipode',
          attributes: {
            lat: -22.0,
            long: -66.0
          }
        }
      }
      response = @service.get_forecast
      expect(response).to be_a(Hash)
      expect(response[:currently]).to be_a(Hash)
      expect(response[:currently][:temperature]).to be_a(Float)
    end
  end
end
