require 'rails_helper'

describe Location do
  describe 'relationships' do
    it { should have_many :user_locations }
    it { should have_many :users }
  end

  describe 'instance methods' do
    it 'forecast' do
      cq = Location.create(
        search_location: 'Denver, CO',
        location_name: 'Denver, CO',
        latitude: 39.7,
        longitude: 104.9
      )
      actual = cq.forecast
      expect(actual).to be_a(Forecast)
    end
  end
end
