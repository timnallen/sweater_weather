class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(LocationFacade.new(params[:location]).get_forecast_for_location)
  end
end
