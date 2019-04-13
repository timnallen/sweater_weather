class LocationService
  def self.get_forecast_for_location(location)
    fetch_data(location)
  end

  private

  def self.fetch_data(location)
    coordinate_query = geocoding_service.find_lat_and_long(location)
    forecast_data = dark_sky_service.get_forecast(coordinate_query)
    package_data(coordinate_query, forecast_data)
  end

  def self.package_data(coordinate_query, forecast_data)
    {
      location: coordinate_query.location_name,
      country: coordinate_query.country,
      time: forecast_data[:currently][:time],
      icon: forecast_data[:currently][:icon],
      temperature: forecast_data[:currently][:temperature],
      today_high: forecast_data[:daily][:data][0][:temperatureHigh],
      today_low: forecast_data[:daily][:data][0][:temperatureLow],
      today_summary: forecast_data[:currently][:summary],
      tonight_summary: forecast_data[:hourly][:summary],
      feels_like: forecast_data[:currently][:apparentTemperature],
      humidity: forecast_data[:currently][:humidity],
      visibility: forecast_data[:currently][:visibility],
      uv_index: forecast_data[:currently][:uvIndex],
      hours: hourly_data(forecast_data[:hourly]),
      days: daily_data(forecast_data[:daily])
    }
  end

  def self.hourly_data(data)
    data[:data].map do |hour|
      {
        time: hour[:time],
        icon: hour[:icon],
        temperature: hour[:temperature]
      }
    end
  end

  def self.daily_data(data)
    data[:data].map do |day|
      {
        time: day[:time],
        icon: day[:icon],
        precip_prob: day[:precipProbability],
        high: day[:temperatureHigh],
        low: day[:temperatureLow],
      }
    end
  end

  def self.geocoding_service
    GeocodingService.new('https://maps.googleapis.com')
  end

  def self.dark_sky_service
    DarkSkyService.new('https://api.darksky.net')
  end
end
