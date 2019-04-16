require 'rails_helper'

describe KeyGenerator do
  it 'exists and creates an api_key for a user upon creation' do
    user = User.create(email: '1@email.com', password: '1', password_confirmation: '1')
    key_gen = KeyGenerator.new(user)
    expect(key_gen).to be_a(KeyGenerator)
    expect(user.api_key).to be_a(String)
  end
end
