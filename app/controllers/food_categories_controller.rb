# FoodCategory Controller
class FoodCategoriesController < ApplicationController
  def new
    @food_category = FoodCategory.new
  end

  def create
    @food_category = FoodCategory.new(food_category_params)
    if @food_category.save
      redirect_to food_category_path(@food_category)
    end
  end

  def edit
    @food_category = FoodCategory.find(params[:id])
  end

  def update
    @food_category = FoodCategory.find(params[:id])
      if @food_category.update(food_category_params)
        redirect_to food_category_path(@food_category)
      else
        render 'edit'
      end
  end

  def index
    @food_categories = FoodCategory.all
  end

  def destroy
    @food_category = FoodCategory.find(params[:id])
    @food_category.destroy
    redirect_to food_categories_path
  end

  def show
    @food_category = FoodCategory.find(params[:id])
  end

  def change_category
    @category = Restaurant.find(params[:category]).id
  end

  private

  def food_category_params
    params.require(:food_category).permit(:restaurant_id, :category_id, :name)
  end
end
