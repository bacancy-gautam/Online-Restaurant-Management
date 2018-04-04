# Controller for Food Items
class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy, :add_food_to_fav]

  def index
    @fooditems = FoodItem.all
  end

  def new
    @fooditem = FoodItem.new
    @fooditem.images.build
  end

  def create
    @fooditem = FoodItem.new(food_item_params)
    if @fooditem.save
      #redirect_to @fooditem
      redirect_to root_path
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
    AddFoodToFavourite.new({user: current_user, fooditem: @fooditem}).create
    respond_to do |format|
      format.html do
        redirect_to restaurant_path(@fooditem.restaurant),
                    notice: 'Added to Favourite.'
      end
      format.js
    end
  end

  private

  def set_food_item
    @fooditem = FoodItem.find(params[:id])
  end

  def food_item_params
    params.require(:food_item).permit(:name, :price, :food_type,
                                      :restaurant_id, :category_id, :image)

  end

end
