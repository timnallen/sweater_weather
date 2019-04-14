require 'rails_helper'

describe 'Forecast API' do
  it 'gets weather for a city' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to be_a(Hash)
    expect(response_body[:location]).to be_a(String)
    expect(response_body[:country]).to be_a(String)
    expect(response_body[:time]).to be_a(String)
    expect(response_body[:current_weather_info]).to be_a(Hash)
    expect(response_body[:hourly_data]).to be_a(Array)
    expect(response_body[:daily_data]).to be_a(Array)
  end
end
