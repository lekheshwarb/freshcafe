class UsersController < ApplicationController
  def index
    # users = User.where(role: params[:role])
    users = User.all()
    render json: { users: users }, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: { user: user }, status: :ok
    else
      render json: { user: user }, status: :unprocessable_entity
    end
  end

  def update
    puts "Hello world"
    user = User.find(params[:id])
    puts (user)
    if user.update(user_params)
      render json: { user: user }, status: :ok
    else
      render json: { user: user }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role, :email, :phone, :address, :password)
  end
end
