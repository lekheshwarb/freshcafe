class UsersController < ApplicationController
  def index
    users = User.all()
    render json: { status: "SUCCESS", message: "Loaded users", data: users }, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: { status: "SUCCESS", message: "Added User", data: user }, status: :ok
    else
      render json: { status: "ERROR", message: "User Not Saved", data: user }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: { status: "SUCCESS", message: "Updated User", data: user }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to Update User", data: user }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :role, :email, :phone, :address)
  end
end
