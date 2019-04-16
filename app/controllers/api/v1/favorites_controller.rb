class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: favorite_params[:api_key])
    if user
      render json: LocationSerializer.new(user.coordinate_queries)
    else
      render json: {}, status: 401
    end
  end

  def create
    user = User.find_by(api_key: favorite_params[:api_key])
    if user
      cq = CoordinateQuery.find_by(location_name: favorite_params[:location])
      UserCoordinateQuery.create(user: user, coordinate_query: cq)
      render json: {}, status: 201
    else
      render json: {}, status: 401
    end
  end

  private

  def favorite_params
    params.permit(:api_key, :location)
  end
end
