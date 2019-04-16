class DarkSkyService < ApplicationService
  def initialize(coordinate_query)
    @coordinate_query = coordinate_query
    @domain_name = 'https://api.darksky.net'
  end

  def get_forecast
    get_json("/forecast/#{authenticate!}/#{request_formatter}")
  end

  private

  attr_reader :coordinate_query

  def request_formatter
    if coordinate_query.class == CoordinateQuery
      "#{coordinate_query.latitude},#{coordinate_query.longitude}"
    else
      lat = coordinate_query[:data][:attributes][:lat]
      long = coordinate_query[:data][:attributes][:long]
      "#{lat},#{long}"
    end
  end

  def authenticate!
    ENV['DARKSKY_API_KEY']
  end
end
