class OrdersController < ApplicationController
  def index
    orders = Order.all()
    render json: { status: "SUCCESS", message: "Loaded Orders", data: orders }, status: :ok
  end

  def create
    order = Order.new(order_params)
    if order.save
      render json: { status: "SUCCESS", message: "Added new Order", data: order }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to create new order", data: order }, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])

    if order.delete
      render json: { status: "SUCCESS", message: "Deleted Order", data: order }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to delete the Order", data: order }, status: :unprocessable_entity
    end
  end

  def update
    order = Order.find(params[:id])
    order[:status] = params[:status]

    if params[:status] == "delivered"
      order.delivered_at = DateTime.now
    end

    if order.update(order_params)
      render json: { status: "SUCCESS", message: "Updated status", data: order }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to update status", data: order }, status: :ok
    end
  end

  private

  def order_params
    params.permit(:user_id, :status, :instructions)
  end
end
