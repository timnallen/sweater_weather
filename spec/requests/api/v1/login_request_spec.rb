require 'rails_helper'

describe 'user can login' do
  before :each do
    @user = User.create(email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password',
      api_key: 'this_is_an_api_key'
    )
  end

  it 'allows a user to login' do
    data = {
      email: @user.email,
      password: @user.password
    }
    post '/api/v1/sessions', params: data

    expect(response).to be_successful
    expect(response.code).to eq('200')
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body.keys).to eq([:api_key])
    expect(response_body[:api_key]).to eq('this_is_an_api_key')
  end

  it 'shows 401 if user does not create properly' do
    data = {
      email: "",
      password: ""
    }
    post '/api/v1/sessions', params: data

    expect(response.code).to eq("401")
  end
end
