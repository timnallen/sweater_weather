class DarkSkyService < ApplicationService
  def get_forecast(coordinate_query)
    get_json("/forecast/#{authenticate!}/#{request_formatter(coordinate_query)}")
  end

  private

  def request_formatter(coordinate_query)
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
