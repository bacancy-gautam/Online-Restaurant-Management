 # FoodCategory Controller
class FoodCategoriesController < ApplicationController
  def new
    authorize FoodCategory, :new?
    @food_category = FoodCategory.new
  end

  def create
    authorize FoodCategory, :create?
    @food_category = FoodCategory.new(food_category_params)
    if @food_category.save
      redirect_to food_category_path(@food_category)
    end
  end

  def edit
    authorize FoodCategory, :edit?
    @food_category = FoodCategory.find(params[:id])

  end

  def update
    authorize FoodCategory, :edit?
    @food_category = FoodCategory.find(params[:id])
      if @food_category.update(food_category_params)
        redirect_to food_category_path(@food_category)
      else
        render 'edit'
      end
  end

  def index
    authorize FoodCategory, :index?
    @food_categories = FoodCategory.all
  end

  def destroy
    authorize FoodCategory, :destroy?
    @food_category = FoodCategory.find(params[:id])
    @food_category.destroy
    redirect_to food_categories_path
  end

  def show
    authorize FoodCategory, :show?
    @food_category = FoodCategory.find(params[:id])
  end

  def change_category
    authorize FoodCategory, :change_category?
    @category = Restaurant.find(params[:category]).id
  end

  private

  def food_category_params
    params.require(:food_category).permit(:restaurant_id, :category_id, :name)
  end
end
