require 'rails_helper'

describe 'User can create an account' do
  data = {
    email: "whatever@example.com",
    password: "password",
    password_confirmation: "password"
  }
  post '/api/v1/users', data: data

  expect(response).to be_successful
  expect(response.body.keys).to eq(['api_key'])
  expect(response.body['api_key']).to be_a(String)
end
