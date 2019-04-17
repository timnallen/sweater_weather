class ApplicationController < ActionController::API
  def four_oh_one
    render json: {}, status: 401
  end
end
