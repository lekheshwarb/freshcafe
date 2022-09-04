class MenuCategoriesController < ApplicationController
  def index
    categories = MenuCategory.all()
    render json: { status: "SUCCESS", message: "Loaded Categories", data: categories }, status: :ok
  end
end
