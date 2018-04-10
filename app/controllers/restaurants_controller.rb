# Controller for Restaurant
class RestaurantsController < ApplicationController

  before_action :fetch_restaurant, only: [:show, :edit, :update,
                                          :add_restaurant_to_fav, :food_by_category]

  def new
    @restaurant = Restaurant.new
    @address = @restaurant.create_address
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      @restaurants = Restaurant.all
      flash[:success] = 'Restaurant created!'
      respond_to do |format|
        format.html { render(partial: 'active_restaurant') }
        format.js
      end
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      @restaurants = Restaurant.all
      flash[:success] = 'Restaurant updated!'
      respond_to do |format|
        format.html do
          render(partial: 'active_restaurant')
        end
        format.js
      end
    else
      render 'edit'
    end
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
    @categories = @restaurant.categories
    @fooditems = @restaurant.food_items.includes(:category)
    @review = Review.new
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end

  def food_by_category
    @restaurant.food_categories
  end

  def index
    @restaurants = Restaurant.includes(:address).active_restaurants
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    flash[:success] = 'Restaurant updated!' if @restaurant.destroy
    redirect_to restaurants_path
  end

  def new_release
    @fooditem = FoodItem.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def add_restaurant_to_fav
    AddRestaurantToFavourite.new({ user: current_user, restaurant: @restaurant }).create
    respond_to do |format|
      format.html do
        redirect_to restaurants_path, notice: 'Added to Favourite.'
      end
      format.js
    end
  end

  def search
    @fooditems = FoodItem.ransack(name_cont: params[:term])
                         .result(distinct: true)
    @restaurants = Restaurant.find(@fooditems.pluck(:restaurant_id))
    respond_to do |format|
      format.html {}
      format.json do
        @fooditems = @fooditems.limit(5)
        @restaurants = Restaurant.find(@fooditems.pluck(:restaurant_id))
      end
    end
  end

  def restaurant_list
    @restaurants = Restaurant.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def change_restaurant_status
    @restaurant = Restaurant.find(params[:id])
    @restaurant.status = !@restaurant.status
    @restaurant.save
  end

  def location
    @addresses = Address.ransack(area_or_city_cont: params[:loc])
                        .result(distinct: true)
    # @city = Restaurant.ransack(city_cont: params[:loc])
    #                .result(distinct: true)
    respond_to do |format|
      format.html {}
      format.json do
        @addresses = @addresses.limit(5)
      end
    end
  end

  def area_wise_restaurants
    adress = Address.where(area: params[:area]).pluck(:addressable_id)
    @restaurants = Restaurant.where(id: adress)
    # @city =  Restaurant.ransack(city_cont: params[:loc])
    #                    .result(distinct: true)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name, :details, :phone_no, :email, :opening_time,
      :closing_time, :delivery_types, :branch_name, :image,
      address_attributes: [:addressline, :area, :city, :state, :pincode]
    )
  end

  def fetch_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
