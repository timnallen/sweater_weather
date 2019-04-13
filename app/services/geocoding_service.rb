class GeocodingService < ApplicationService
  def find_lat_and_long(location)
    coordinate_query = CoordinateQuery.find_by(query: location)
    return coordinate_query if coordinate_query
    add_coordinate_to_db(location)
  end

  private

  def add_coordinate_to_db(location)
    response_body = get_json("/maps/api/geocode/json?address=#{location}#{authenticate!}")
    coordinates = response_body[:results][0][:geometry][:location]
    CoordinateQuery.create(query: location,
      latitude: coordinates[:lat],
      longitude: coordinates[:lng])
  end

  def authenticate!
    "&key=#{ENV['GEOCODE_API_KEY']}"
  end
end
