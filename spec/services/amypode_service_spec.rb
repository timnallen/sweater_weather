require 'rails_helper'

RSpec.describe AmypodeService do
  describe 'instance methods' do
    it '#get_antipode' do
      service = AmypodeService.new('http://amypode.herokuapp.com')
      coordinate_query = CoordinateQuery.create(
        latitude: 22.3193039,
        longitude: 114.1693611
      )
      expected = {:data=>
        {
          :id=>"1",
          :type=>"antipode",
          :attributes=>{
            :lat=>-22.0,
            :long=>-66.0
            }
          }
        }
      expect(service.get_antipode(coordinate_query)).to eq(expected)
    end
  end
end
