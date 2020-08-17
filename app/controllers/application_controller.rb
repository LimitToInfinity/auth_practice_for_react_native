class ApplicationController < ActionController::API

  before_action :authenticate

  def authenticate
    auth_header = request.headers['Authorization']

    if !auth_header
      render json: { message: 'No token' }, status: :forbidden
    else
      render json: { message: 'cool token' }, status: :ok
    end
  end

end
