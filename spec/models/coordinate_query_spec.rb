require 'rails_helper'

describe CoordinateQuery do
  describe 'relationships' do
    it { should have_many :user_coordinate_queries }
    it { should have_many :users }
  end
end
