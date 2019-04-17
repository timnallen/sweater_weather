class Api::V1::FavoritesController < ApplicationController
  def index
    if user
      render json: LocationSerializer.new(user.locations)
    else
      four_oh_one
    end
  end

  def create
    if user
      UserLocation.create(user: user, location: location)
      render json: {}, status: 201
    else
      four_oh_one
    end
  end

  def destroy
    if user
      user_location = UserLocation.find_by(user: user, location: location)
      user_location.destroy
      render json: LocationSerializer.new(location)
    else
      four_oh_one
    end
  end

  private

  def location
    @location ||= LocationFacade.new(favorite_params[:location]).location
  end

  def user
    @user ||= User.find_by(api_key: favorite_params[:api_key])
  end

  def favorite_params
    params.permit(:api_key, :location)
  end
end
