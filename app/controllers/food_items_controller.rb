# Controller for Food Items
class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy, :add_food_to_fav]

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
    @favourite = @fooditem.favourites.find_by(user_id: current_user.id)
    if @favourite
      @favourite.delete
    else
      @fooditem.favourites.find_or_create_by(user_id: current_user.id)
      respond_to do |format|
        format.html do
          redirect_to restaurant_path(@fooditem.restaurant),
                      notice: 'Added to Favourite.'
        end
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
