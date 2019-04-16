require 'rails_helper'

describe 'Forecast API' do
  it 'gets weather for a city' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body).to be_a(Hash)
    expect(response_body[:attributes][:location]).to be_a(String)
    expect(response_body[:attributes][:country]).to be_a(String)
    expect(response_body[:attributes][:time]).to be_a(String)
    expect(response_body[:attributes][:current_weather]).to be_a(Hash)
    expect(response_body[:attributes][:hourly_forecasts]).to be_a(Array)
    expect(response_body[:attributes][:daily_forecasts]).to be_a(Array)
  end
end
