require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many :user_coordinate_queries }
    it { should have_many :coordinate_queries }
  end
end
