class Api::V1::FavoritesController < ApplicationController
  def index
    if user
      render json: LocationSerializer.new(user.coordinate_queries)
    else
      four_oh_one
    end
  end

  def create
    if user
      UserCoordinateQuery.create(user: user, coordinate_query: cq)
      render json: {}, status: 201
    else
      four_oh_one
    end
  end

  def destroy
    if user
      ucq = UserCoordinateQuery.find_by(user: user, coordinate_query: cq)
      ucq.destroy
      render json: LocationSerializer.new(cq)
    else
      four_oh_one
    end
  end

  private

  def cq
    @cq ||= CoordinateQuery.find_by(location_name: favorite_params[:location])
  end

  def user
    @user ||= User.find_by(api_key: favorite_params[:api_key])
  end

  def favorite_params
    params.permit(:api_key, :location)
  end
end
