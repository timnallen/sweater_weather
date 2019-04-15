class Api::V1::AntipodeController < ApplicationController
  def show
    render json: AntipodeService.get_antipode_data(params[:loc])
  end
end
