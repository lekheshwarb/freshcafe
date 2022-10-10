class SessionsController < ApplicationController
  skip_before_action :set_current_user, :authenticate_request

  def login
    puts params
    uEmail = params[:email]
    user = User.where(email: uEmail).first
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      # ember-simple-auth needs token in 'access_token' key for oauth2
      render json: { access_token: token }, status: :ok
    else
      render json: { errors: "Invalid username or password" }, status: :unauthorized
    end
  end
end
