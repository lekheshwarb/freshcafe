class UsersController < ApplicationController
  skip_before_action :set_current_user, :authenticate_request, only: [:create]

  def index
    if params[:me].present?
      users = User.find(@current_user.id)
      puts users
    else
      users = User.all
    end
    render json: { users: users }

    # users = User.all()
    # render json: { users: users }, status: :ok
  end

  def create
    puts params
    user = User.new(user_params)
    if user.save
      payload = { id: user.id }
      render json: { user: user }, status: :created
    else
      render json: { user: user }, status: :unprocessable_entity
    end
  end

  def update
    puts "test"
    user = User.find(params[:id])
    puts (user_params)

    if user.update(user_params)
      render json: { user: user }, status: :ok
    else
      render json: { ERROR: "Error", user: user }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role, :email, :phone, :address, :password)
  end
end
