class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackgroundSerializer.new(BackgroundFacade.new(params[:location]).get_location_background)
  end
end
