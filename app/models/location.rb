class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations

  def forecast
    Forecast.new(self, weather_report.get_forecast)
  end

  private

  def weather_report
    DarkSkyService.new(self)
  end
end
