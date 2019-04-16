require 'rails_helper'

describe 'user can favorite' do
  before :each do
    @user = User.create(
      email: '1@email.com',
      password: '1',
      password_confirmation: '1',
      api_key: 'api_key'
    )
  end

  it 'allows a user to select a favorite' do
    cq = CoordinateQuery.create(
      query: 'Denver, CO',
      location_name: 'Denver, CO',
      latitude: 39.7,
      longitude: 104.9
    )
    body = {
      location: cq.location_name,
      api_key: @user.api_key
    }
    post '/api/v1/favorites', params: body

    ucq = UserCoordinateQuery.last

    expect(response).to be_successful
    expect(response.code).to eq('201')

    expect(ucq.user).to eq(@user)
    expect(ucq.coordinate_query).to eq(cq)
  end

  it 'wont allow a favorite with a bad api_key' do
    body = {
      location: 'Denver, CO',
      api_key: ''
    }
    post '/api/v1/favorites', params: body

    expect(response.code).to eq('401')
  end
end
