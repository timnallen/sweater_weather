require 'rails_helper'

describe 'Background API' do
  it 'gets weather for a city' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response_body).to be_a(Hash)
    expect(response_body[:attributes]).to be_a(Hash)
    expect(response_body[:attributes][:image]).to be_a(String)
  end
end
