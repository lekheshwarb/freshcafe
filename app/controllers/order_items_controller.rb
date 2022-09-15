class OrderItemsController < ApplicationController
  def index
    orders = OrderItem.all()
    render json: { order: orders }, status: :ok
  end

  def create
    order_item = OrderItem.new(order_item_params)

    if order_item.save
      render json: { status: "SUCCESS", message: "Created new order item", data: order_item }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to create new order item", data: order_item }, status: :unprocessable_entity
    end
  end

  private

  def order_item_params
    params.permit(:order_id, :menu_item_id, :quantity, :menu_item_name, :menu_item_price)
  end
end
