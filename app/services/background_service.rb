class BackgroundService < ApplicationService
  def get_background(location)
    get_json("/search/photos?query=#{location},city#{authenticate!}")
  end

  private

  def authenticate!
    "&client_id=#{ENV['UNSPLASH_ACCESS_KEY']}"
  end
end
