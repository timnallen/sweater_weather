class AmypodeService < ApplicationService
  def get_antipode(coordinate_query)
    lat = coordinate_query.latitude.to_i
    long = coordinate_query.longitude.to_i
    get_json("/api/v1/antipodes?lat=#{lat}&long=#{long}", authenticate!)
  end

  private

  def authenticate!
    ENV['AMYPODE_KEY']
  end
end
