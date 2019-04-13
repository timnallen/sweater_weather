class GeocodingService < ApplicationService
  def find_lat_and_long(location)
    coordinate_query = CoordinateQuery.find_by(query: location)
    return coordinate_query if coordinate_query
    add_location_to_db(location)
  end

  private

  def add_location_to_db(location)
    response = geocode_response(location)
    CoordinateQuery.create(query: location,
      location_name: formatted_address(response),
      country: country(response),
      latitude: coordinates(response)[:lat],
      longitude: coordinates(response)[:lng])
  end

  def geocode_response(location)
    @response ||= get_json("/maps/api/geocode/json?address=#{location}#{authenticate!}")
  end

  def authenticate!
    "&key=#{ENV['GEOCODE_API_KEY']}"
  end

  def formatted_address(response)
    response[:results][0][:formatted_address][0..-6]
  end

  def country(response)
    response[:results][0][:address_components][3][:long_name]
  end

  def coordinates(response)
    @coordinates ||= response[:results][0][:geometry][:location]
  end
end
