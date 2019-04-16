require 'rails_helper'

describe BackgroundService do
  describe 'instance methods' do
    it 'get_background' do
      location = 'denver'
      service = BackgroundService.new('https://api.unsplash.com')

      response = service.get_background(location)

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_a(Array)
      expect(response[:results][0]).to be_a(Hash)
      expect(response[:results][0][:urls]).to be_a(Hash)
      expect(response[:results][0][:urls][:raw]).to be_a(String)
    end
  end
end
