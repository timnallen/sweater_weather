class Api::V1::AntipodeController < ApplicationController
  def show
    render json: AntipodeSerializer.new([AntipodeFacade.new(params[:loc]).get_antipode_data])
  end
end
