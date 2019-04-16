require 'rails_helper'

describe ApplicationService do
  before :each do
    @service = ApplicationService.new('https://api.darksky.net')
  end

  it 'exists' do
    expect(@service).to be_a(ApplicationService)
  end

  it 'has a domain_name' do
    expect(@service.domain_name).to eq('https://api.darksky.net')
  end

  describe 'instance methods' do
    it 'conn' do
      expect(@service.conn).to be_a(Faraday::Connection)
    end

    it 'get_response' do
      response = @service.get_response("/forecast/#{ENV['DARKSKY_API_KEY']}/-22.0,-66.0")
      expect(response).to be_a(Faraday::Response)
    end

    it 'get_json' do
      response = @service.get_json("/forecast/#{ENV['DARKSKY_API_KEY']}/-22.0,-66.0")
      expect(response).to be_a(Hash)
    end
  end
end
