class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :location, :country, :time, :current_weather, :hourly_forecasts,
  :daily_forecasts
end
