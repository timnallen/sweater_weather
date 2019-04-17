class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def get_location_background
    background_data = service.get_background(location)
    Background.new(background_data)
  end

  private

  attr_reader :location

  def service
    BackgroundService.new('https://api.unsplash.com')
  end
end
