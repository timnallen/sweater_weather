require 'rails_helper'

describe 'Antipode API' do
  it 'gets an antipode for a city' do
    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body).to be_a(Array)
    expect(response_body[0]).to be_a(Hash)
    expect(response_body[0][:id]).to be_a(String)
    expect(response_body[0][:type]).to eq('antipode')
    expect(response_body[0][:attributes]).to be_a(Hash)
    expect(response_body[0][:attributes][:location_name]).to be_a(String)
    expect(response_body[0][:attributes][:forecast]).to be_a(Hash)
    expect(response_body[0][:search_location]).to eq('Hong Kong')
  end
end
