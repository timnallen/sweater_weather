class Api::V1::AntipodeController < ApplicationController
  def show
    render json: AntipodeSerializer.new([AntipodeFacade.new.get_antipode_data(params[:loc])])
  end
end
