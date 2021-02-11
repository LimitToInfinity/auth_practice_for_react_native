class AuthenticationController < ApplicationController

  skip_before_action :authenticate, only: [:login]

  def login
    @user = User.find_by username: params[:username]

    if !@user
      render json: { message: 'User does not exist' }, status: :unauthorized
    else

      if !@user.authenticate params[:password]
        render json: { message: 'Bad password' }, status: :unauthorized
      else
        payload = { user_id: @user.id }
        secret = ENV['SECRET_KEY_BASE']
        token = JWT.encode payload, secret

        render json: { token: token }, status: :ok
      end

    end
  end

end
