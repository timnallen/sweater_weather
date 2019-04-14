class LocationFormatter
  def format_location(coordinate_query, forecast_data)
    {
      location: coordinate_query.location_name,
      country: coordinate_query.country,
      time: Time.at(forecast_data[:currently][:time]),
      current_weather_info: current_weather_info(forecast_data),
      hourly_data: hourly_data(forecast_data[:hourly]),
      daily_data: daily_data(forecast_data[:daily])
    }
  end

  private

  def current_weather_info(forecast_data)
    {
      icon: forecast_data[:currently][:icon],
      temperature: forecast_data[:currently][:temperature],
      today_high: forecast_data[:daily][:data][0][:temperatureHigh],
      today_low: forecast_data[:daily][:data][0][:temperatureLow],
      today_summary: forecast_data[:currently][:summary],
      tonight_summary: forecast_data[:hourly][:summary],
      feels_like: forecast_data[:currently][:apparentTemperature],
      humidity: forecast_data[:currently][:humidity],
      visibility: forecast_data[:currently][:visibility],
      uv_index: forecast_data[:currently][:uvIndex]
    }
  end

  def hourly_data(data)
    data[:data].map do |hour|
      {
        time: Time.at(hour[:time]),
        icon: hour[:icon],
        temperature: hour[:temperature]
      }
    end
  end

  def daily_data(data)
    data[:data].map do |day|
      {
        time: Time.at(day[:time]),
        icon: day[:icon],
        precip_prob: day[:precipProbability],
        high: day[:temperatureHigh],
        low: day[:temperatureLow],
      }
    end
  end
end
