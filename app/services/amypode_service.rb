class AmypodeService < ApplicationService
  def get_antipode(location)
    lat = location.latitude.to_i
    long = location.longitude.to_i
    get_json("/api/v1/antipodes?lat=#{lat}&long=#{long}", authenticate!)
  end

  private

  def authenticate!
    ENV['AMYPODE_KEY']
  end
end
