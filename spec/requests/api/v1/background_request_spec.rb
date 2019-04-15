require 'rails_helper'

describe 'Background API' do
  it 'gets weather for a city' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

  end
end
