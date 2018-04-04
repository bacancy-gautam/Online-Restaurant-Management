# Controller for Food Items
class FoodItemsController < ApplicationController
  before_action :food_item_params, only: [:update]
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
      @fooditems = FoodItem.all
      respond_to do |format|
        format.html { render(partial: 'fooditems') }
        format.js { render 'index' }
      end
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @fooditem.update(food_item_params)
      @fooditems = FoodItem.all
      render 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @fooditem.destroy
    @fooditems = FoodItem.all
    render('index')
    # redirect_to food_items_path
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
    params.require(:food_items).permit(:name, :price, :food_type,
                                      :restaurant_id, :category_id, :image)
  end

end
