require 'rails_helper'

RSpec.describe AntipodeService do
  describe 'class methods' do
    it '::get_antipode_data' do
      location = 'hongkong'
      response = AntipodeService.get_antipode_data(location)
      expect(response).to be_a(Hash)
      expect(response[:data]).to be_a(Array)
      expect(response[:data][0]).to be_a(Hash)
      expect(response[:data][0][:search_location]).to eq('Hong Kong')
    end
  end
end
