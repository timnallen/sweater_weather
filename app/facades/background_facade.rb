class BackgroundFacade
  def get_location_background(location)
    background_data = service.get_background(location)
    Background.new(background_data)
  end

  private

  def service
    BackgroundService.new('https://api.unsplash.com')
  end
end
