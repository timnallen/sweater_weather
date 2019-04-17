require 'rails_helper'

describe 'user can favorite' do
  before :each do
    @user = User.create(
      email: '1@email.com',
      password: '1',
      password_confirmation: '1',
      api_key: 'api_key'
    )
    @cq = CoordinateQuery.create(
      query: 'Denver, CO',
      location_name: 'Denver, CO',
      latitude: 39.7,
      longitude: 104.9
    )
    UserCoordinateQuery.create(user: @user, coordinate_query: @cq)
  end

  it 'allows a user to select a favorite' do
    cq_1 = CoordinateQuery.create(
      query: 'Fort Collins, CO',
      location_name: 'Fort Collins, CO',
      latitude: 40.5,
      longitude: 105.1
    )
    body = {
      location: cq_1.location_name,
      api_key: @user.api_key
    }
    post '/api/v1/favorites', params: body

    ucq = UserCoordinateQuery.last

    expect(response).to be_successful
    expect(response.code).to eq('201')

    expect(ucq.user).to eq(@user)
    expect(ucq.coordinate_query).to eq(cq_1)
  end

  it 'wont allow a favorite with a bad api_key' do
    body = {
      location: 'Fort Collins, CO',
      api_key: ''
    }
    post '/api/v1/favorites', params: body

    expect(response.code).to eq('401')
  end

  it 'returns a list of favorites' do
    body = {
      api_key: @user.api_key
    }
    get '/api/v1/favorites', params: body

    expect(response).to be_successful
    expect(response.code).to eq('200')
    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body).to be_a(Array)
    expect(response_body[0]).to be_a(Hash)
    expect(response_body[0][:attributes].keys).to eq([:location, :current_weather])
  end

  it 'will send a 401 with no api key' do
    body = {
      api_key: ''
    }
    get '/api/v1/favorites', params: body

    expect(response.code).to eq('401')
  end

  it 'allows users to delete favorites' do
    body = {
      location: @cq.location_name,
      api_key: @user.api_key
    }

    delete '/api/v1/favorites', params: body

    expect(response).to be_successful
    expect(response.code).to eq('200')
    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body).to be_a(Hash)
    expect(response_body[:attributes].keys).to eq([:location, :current_weather])

    expect(@user.coordinate_queries).to_not include(@cq)
  end

  it 'doesnt allow users to delete without an api key' do
    body = {
      location: @cq.location_name,
      api_key: ''
    }

    delete '/api/v1/favorites', params: body

    expect(response.code).to eq('401')
  end
end
