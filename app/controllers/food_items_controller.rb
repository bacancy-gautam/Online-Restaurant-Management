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

  def add_food_to_fav
    @fooditem = FoodItem.find(params[:id])
    if current_user.favourites.pluck(:food_item_id).include?(@fooditem.id)
      @favourite = Favourite.find_by(food_item_id: @fooditem.id, user_id: current_user.id)
      @favourite.delete
    else
      @favourite = Favourite.create(food_item_id: @fooditem.id, user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to restaurant_path(@fooditem.restaurant), notice: 'Added to Favourite.' }
        format.js
      end
    end
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
