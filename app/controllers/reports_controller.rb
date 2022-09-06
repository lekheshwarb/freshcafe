class ReportsController < ApplicationController
  def overview
    render json: { message: "Reports overview" }
  end

  def invoices
    user = params[:user_id]
    from_date = params[:from_date]
    to_date = params[:to_date]

    orders = Order.where(user_id: user).where("created_at BETWEEN ? AND ?", from_date, to_date)

    invoices = []

    orders.each do |order|
      id = order[:id]
      user = User.where(id: order[:user_id]).first
      order_items = OrderItem.where(order_id: id)

      item_list = []

      order_items.each do |item|
        item = { quantity: item[:quantity], item_name: item[:menu_item_name], item_price: item[:menu_item_price] }
        item_list.push(item)
      end

      invoice = { id: id, user_name: user[:name], status: order[:status], created_on: order[:created_at], items: item_list }
      invoices.push(invoice)
    end

    render json: { status: "SUCCESS", message: "Get order reports", data: invoices }, status: :ok
  end
end
