class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant created!"
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = "Restaurant updated!"
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @categories = @restaurant.categories
  end

  def index
    @restaurants = Restaurant.all
   
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def new_release
    @fooditem = FoodItem.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_no, :email, :opening_time, :closing_time, :delivery_types, :branch_name)
  end
end
