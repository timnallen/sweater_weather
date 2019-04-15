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
      expect(@service.conn).to be_a(Faraday)
    end

    it 'get_response' do
      expect(@service.get_response())
    end
  end
end
