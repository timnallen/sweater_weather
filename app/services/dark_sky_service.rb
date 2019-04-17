class DarkSkyService < ApplicationService
  def initialize(location)
    @location = location
    @domain_name = 'https://api.darksky.net'
  end

  def get_forecast
    get_json("/forecast/#{authenticate!}/#{request_formatter}")
  end

  private

  attr_reader :location

  def request_formatter
    if location.class == Location
      "#{location.latitude},#{location.longitude}"
    else
      lat = location[:data][:attributes][:lat]
      long = location[:data][:attributes][:long]
      "#{lat},#{long}"
    end
  end

  def authenticate!
    ENV['DARKSKY_API_KEY']
  end
end
