require 'rails_helper'

RSpec.describe AntipodeFormatter do
  describe 'class methods' do
    it '::format' do
      forecast_data = {
        currently: {
          summary: 'fake',
          temperature: '1'
        }
      }
      antipode_coordinate_data = {
        data: {
          id: '1',
          type: 'antipode',
          attributes: {
            lat: -22.0,
            long: -66.0
          }
        }
      }
      location_name = 'Santa Catalina'
      search_location = CoordinateQuery.create(location_name: 'Hong Kong')
      actual = AntipodeFormatter.format(antipode_coordinate_data, location_name, forecast_data, search_location)
      expected = {
        data: [
          {
            id: '1'
          }
        ]
      }
    end
  end
end
