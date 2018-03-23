# Controller for Categories of Restaurant
class RestaurantscategoriesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @category = params[:restaurant][:category_ids]
    @category = @category.reject(&:empty?)
    @category_array = []
    @category.each do |category|
      @category_array.push(Category.find(category))
    end

    @restaurant = params[:restaurant][:restaurant_id]
    @restaurant = Restaurant.find(@restaurant)
    @restaurant.categories.delete_all
    @category_array.each do |category|
      category.restaurants << @restaurant
    end
    redirect_to restaurantscategories_path
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
    @category = {}
    id = @restaurant.id
    @category[id] = @restaurant.categories
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @user = current_user
    @category = {}
    @restaurant = Restaurant.where(user_id: @user.id)
    @restaurant.each do |restaurant|
      @category[restaurant.id] = restaurant.categories
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.categories.delete_all
    @category = params[:restaurant][:category_ids]
    @category = @category.reject(&:empty?)
    @category_array = []
    @category.each do |category|
      @category_array.push(Category.find(category))
    end

    @category_array.each do |category|
      category.restaurants << @restaurant
    end

    redirect_to restaurantscategories_path
  end
end
