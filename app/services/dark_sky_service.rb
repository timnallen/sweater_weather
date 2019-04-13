class DarkSkyService < ApplicationService
  def get_forecast(coordinate_query)
    get_json("/forecast/#{request_formatter(coordinate_query)}")
  end

  private

  def request_formatter(coordinate_query)
    "#{authenticate!}/#{coordinate_query.latitude},#{coordinate_query.longitude}"
  end

  def authenticate!
    ENV['DARKSKY_API_KEY']
  end
end
