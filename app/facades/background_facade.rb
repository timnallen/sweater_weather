class BackgroundFacade
  def initialize(search_location)
    @search_location = search_location
  end

  def get_location_background
    background_data = service.get_background(search_location)
    Background.new(background_data)
  end

  private

  attr_reader :search_location

  def service
    BackgroundService.new('https://api.unsplash.com')
  end
end
