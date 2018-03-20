class RestaurantscategoriesController < ApplicationController
  before_action :authenticate_user!
  def new
  end
  def create
    @category = params[:restaurant][:category_ids]
    @category = @category.reject { |c| c.empty? }
    @category_array=[]
    @category.each do |category|
      @category_array.push(Category.find(category))
    end
    @restaurant= params[:restaurant][:restaurant_id]
    @restaurant=Restaurant.find(@restaurant)
    @restaurant.categories.delete_all
    @category_array.each do |category|
      category.restaurants<<@restaurant
    end
    redirect_to restaurantscategories_path
  end

  def show
  end

  def edit
  end

  def index
    @user=current_user
    @category=Hash.new
    @restaurant=Restaurant.where(user_id:@user.id)
    @restaurant.each do |restaurant|
      @category[restaurant.id]=restaurant.categories
    end
  
  end  
end
