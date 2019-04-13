class Api::V1::ForecastController < ApplicationController
  def show
    render json: LocationService.get_forecast(params[:location])
  end
end
