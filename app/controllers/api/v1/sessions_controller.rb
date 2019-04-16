class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    user.authenticate(login_params[:password]) if user
    if user
      render json: {
        api_key: user.api_key
      }
    else
      render json: {}, status: 401
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
