require 'rails_helper'

describe CoordinateQuery do
  describe 'relationships' do
    it { should have_many :user_coordinate_queries }
    it { should have_many :users }
  end

  describe 'instance methods' do
    it 'forecast' do
      cq = CoordinateQuery.create(
        query: 'Denver, CO',
        location_name: 'Denver, CO',
        latitude: 39.7,
        longitude: 104.9
      )
      actual = cq.forecast
      expect(actual).to be_a(Forecast)
    end
  end
end
