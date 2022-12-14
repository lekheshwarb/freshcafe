class ApplicationController < ActionController::API
  before_action :set_current_user, :authenticate_request

  private

  def set_current_user
    puts "in set CU"
    if decoded_auth_token
      @current_user = User.find(decoded_auth_token[:user_id])
    end
  end

  def decoded_auth_token
    puts request.headers.inspect
    if request.headers["Authorization"].present?
      token = request.headers["Authorization"].split(" ").last
      JsonWebToken.decode(token)
    end
  end

  def authenticate_request
    unless @current_user
      render json: { errors: "Not Authorized" }, status: :unauthorized
    end
  end
end
