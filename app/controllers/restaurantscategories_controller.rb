# Controller for Categories of Restaurant
class RestaurantscategoriesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @category = params[:restaurant][:category_ids].reject(&:empty?)
    @category_array = Category.find(@category)
    @restaurant = Restaurant.find(params[:restaurant][:restaurant_id])

    @restaurant.categories.delete_all
    @category_array.each do |category|
      category.restaurants << @restaurant
    end
    @restaurants = Restaurant.where(user_id: current_user.id)
    respond_to do |format|
      format.html { render(partial: 'restaurant_category_list') }
      format.js { render 'index' }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @category = @restaurant.categories
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.where(user_id: current_user.id)
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.categories.delete_all
    @category_ids = params[:restaurant][:category_ids].reject(&:empty?)
    @category_array = Category.find(@category_ids)
    @category_array.each do |category|
      category.restaurants << @restaurant
    end

    @restaurants = Restaurant.where(user_id: current_user.id)

    respond_to do |format|
      format.html { render(partial: 'restaurant_category_list') }
      format.js { render 'index' }
    end
  end
end
