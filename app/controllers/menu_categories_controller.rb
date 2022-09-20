class MenuCategoriesController < ApplicationController
  def index
    categories = MenuCategory.all()
    render json: { menu_category: categories }, status: :ok
  end

  def create
    category = MenuCategory.new(menuCategoryParams)
    if category.save
      render json: { menu_category: category }, status: :ok
    else
      render json: { menu_category: category }, status: :unprocessable_entity
    end
  end

  def update
    category = MenuCategory.find(params[:id])
    if category.update(menuCategoryParams)
      render json: { status: "SUCCESS", message: "Updated Category", data: category }, status: :ok
    else
      render json: { status: "ERROR", message: "Failed to Update Category", data: category }, status: :unprocessable_entity
    end
  end

  private

  def menuCategoryParams
    params.require(:menu_category).permit(:name)
  end
end
