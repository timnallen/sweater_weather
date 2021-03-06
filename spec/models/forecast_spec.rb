require 'rails_helper'

describe Forecast, type: :model do
  it 'it exists and has attributes' do
    location = Location.create(
      latitude: 39.7392358,
      longitude: -104.990251,
      search_location: "denver,co",
      location_name: "Denver, CO, USA",
      country: "United States"
    )
    forecast_data = DarkSkyService.new(location).get_forecast
    forecast = Forecast.new(location, forecast_data)
    expect(forecast).to be_a(Forecast)
    expect(forecast.location).to include("Denver, CO")
    expect(forecast.country).to eq("United States")
    expect(forecast.time).to be_a(Time)
    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.hourly_forecasts).to be_a(Array)
    expect(forecast.hourly_forecasts[0]).to be_a(Hash)
    expect(forecast.daily_forecasts).to be_a(Array)
    expect(forecast.daily_forecasts[0]).to be_a(Hash)
  end
end
