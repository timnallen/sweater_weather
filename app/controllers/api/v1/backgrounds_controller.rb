class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackgroundSerializer.new(BackgroundFacade.get_location_background(params[:location]))
  end
end
