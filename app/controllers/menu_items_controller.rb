class MenuItemsController < ApplicationController
  def index
    items = MenuItem.all()
    render json: { status: "SUCCESS", message: "Loaded Categories", data: items }, status: :ok
  end
end
