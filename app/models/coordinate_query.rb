class CoordinateQuery < ApplicationRecord
  has_many :user_coordinate_queries
  has_many :users, through: :user_coordinate_queries

  def forecast
    Forecast.new(self, weather_report.get_forecast)
  end

  private

  def weather_report
    DarkSkyService.new(self)
  end
end
