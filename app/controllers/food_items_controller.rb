# Controller for Food Items
class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]

  def index
    @fooditems = FoodItem.all
  end

  def new
    @fooditem = FoodItem.new
  end

  def create
    @fooditem = FoodItem.new(food_item_params)
    if @fooditem.save
      redirect_to @fooditem
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @fooditem.update(food_item_params)
      redirect_to @fooditem
    else
      render 'edit'
    end
  end

  def destroy
    @fooditem.destroy
    redirect_to food_items_path
  end

  private

  def set_food_item
    @fooditem = FoodItem.find(params[:id])
  end

  def food_item_params
    params.require(:food_item).permit(:name, :price, :food_type,
                                      :restaurant_id, :category_id)
  end
end
