require 'rails_helper'

describe UserCoordinateQuery, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :coordinate_query }
  end
end
