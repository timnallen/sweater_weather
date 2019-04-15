class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(LocationFacade.new.get_forecast_for_location(params[:location]))
  end
end
