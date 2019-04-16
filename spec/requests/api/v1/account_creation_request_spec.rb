require 'rails_helper'

describe 'User can create an account' do
  it 'allows a user to create an account' do
    data = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }
    post '/api/v1/users', params: data

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body.keys).to eq([:api_key])
    expect(response_body[:api_key]).to be_a(String)
  end

  it 'shows 401 if user does not create properly' do
    data = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "passwrd"
    }
    post '/api/v1/users', params: data

    expect(response.code).to eq("401")
  end
end
