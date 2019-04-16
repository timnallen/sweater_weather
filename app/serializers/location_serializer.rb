class LocationSerializer
  include FastJsonapi::ObjectSerializer

  attribute :location do |location|
    location.location_name
  end

  attribute :current_weather do |location|
    location.forecast
  end
end
