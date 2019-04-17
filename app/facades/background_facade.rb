class BackgroundFacade
  def initialize(search_location)
    @search_location = search_location
  end

  def get_location_background
    Rails.cache.fetch("Background/#{search_location}", expires_in: 1.week) do
      background_data = service.get_background(search_location)
      Background.new(background_data)
    end
  end

  private

  attr_reader :search_location

  def service
    BackgroundService.new('https://api.unsplash.com')
  end
end
