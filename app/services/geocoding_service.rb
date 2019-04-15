class GeocodingService < ApplicationService
  def find_lat_and_long(location)
    coordinate_query = CoordinateQuery.find_by(query: location)
    return coordinate_query if coordinate_query
    add_location_to_db(location)
  end

  def search_location_by_coordinates(coordinate_data)
    lat = coordinate_data[:data][:attributes][:lat].to_s
    long = coordinate_data[:data][:attributes][:long].to_s
    latlng = lat + ', ' + long
    geocode_coordinate_response(latlng)[:results][0][:address_components][1][:long_name]
  end

  private

  def geocode_coordinate_response(latlng)
    @response ||= get_json("/maps/api/geocode/json?latlng=#{latlng}#{authenticate!}")
  end

  def add_location_to_db(location)
    response = geocode_location_response(location)
    CoordinateQuery.create(query: location,
      location_name: formatted_address(response),
      country: country(response),
      latitude: coordinates(response)[:lat],
      longitude: coordinates(response)[:lng])
  end

  def geocode_location_response(location)
    @response ||= get_json("/maps/api/geocode/json?address=#{location}#{authenticate!}")
  end

  def authenticate!
    "&key=#{ENV['GEOCODE_API_KEY']}"
  end

  def formatted_address(response)
    response[:results][0][:formatted_address]
  end

  def country(response)
    response[:results][0][:address_components][3][:long_name] if response[:results][0][:address_components][3]
  end

  def coordinates(response)
    @coordinates ||= response[:results][0][:geometry][:location]
  end
end
