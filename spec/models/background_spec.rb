require 'rails_helper'

describe Background, type: :model do
  it 'it exists and has attributes' do
    data = BackgroundService.new('https://api.unsplash.com').get_background('denver')
    background = Background.new(data)
    expect(background).to be_a(Background)
    expect(background.id).to be_a(String)
    expect(background.image).to be_a(String)
  end
end
