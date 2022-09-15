class OrdersController < ApplicationController
  def index
    all_orders = Order.all()
    orders = []

    all_orders.each do |order|
      user_name = User.find(order.user_id).name
      order_items = OrderItem.where(order_id: order.id)

      item_list = []
      order_items.each do |item|
        item = { quantity: item[:quantity], item_name: item[:menu_item_name], item_price: item[:menu_item_price] }
        item_list.push(item)
      end

      modifiedOrder = { id: order[:id], user: user_name, delivered_at: order[:delivered_at], status: order[:status], instructions: order[:instructions], created_at: order[:created_at], order_items: item_list }
      orders.push(modifiedOrder)
    end

    render json: { order: orders }, status: :ok
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
