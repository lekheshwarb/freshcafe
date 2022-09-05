class MenuItemsController < ApplicationController
  def index
    items = MenuItem.all()
    render json: { status: "SUCCESS", message: "Loaded Items", data: items }, status: :ok
  end

  def create
    item = MenuItem.new(menu_item_params)
    if item.save
      render json: { status: "SUCCESS", message: "Added Menu Item", data: items }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to add new Item to Menu", data: items }, status: :unprocessable_entity
    end
  end

  def update
    item = MenuItem.find(params[:id])
    if item.update(menu_item_params)
      render json: { status: "SUCCESS", message: "Updated Item", data: item }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to Update Category", data: itme }, status: :unprocessable_entity
    end
  end

  def destroy
    item = MenuItem.find(params[:id])
    if item.delete
      render json: { status: "SUCCESS", message: "Deleted Item", data: item }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to Delete the Item", data: item }, status: :unprocessable_entity
    end
  end

  private

  def menu_item_params
    params.permit(:name, :description, :price, :production_cost, :menu_category_id, :is_out_of_stock)
  end
end
