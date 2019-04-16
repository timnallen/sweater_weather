class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      KeyGenerator.new(user)
      render json: {api_key: user.api_key}, status: 201
    else
      render json: {}, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
