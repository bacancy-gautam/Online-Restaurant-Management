# Controller for Restaurant
class RestaurantsController < ApplicationController
  before_action :fetch_restaurant, only: [:show, :edit,
                                          :update, :add_restaurant_to_fav]

  def new
    @restaurant = Restaurant.new
    @address = @restaurant.create_address
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      flash[:success] = 'Restaurant created!'
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = 'Restaurant updated!'
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
    @categories = @restaurant.categories
    @fooditems = @restaurant.food_items
    @review = Review.new
  end

  def index
    @restaurants = Restaurant.all
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
    @favourite = @restaurant.favourites.find_by(user_id: current_user.id)
    if @favourite
      @favourite.delete
    else
      @restaurant.favourites.find_or_create_by(user_id: current_user.id)
      respond_to do |format|
        format.html do
          redirect_to restaurants_path, notice: 'Added to Favourite.'
        end
        format.js
      end
    end
  end

  def search
    @restaurants = Restaurant.ransack(name_cont: params[:term])
                             .result(distinct: true)
    @fooditems = FoodItem.ransack(name_cont: params[:term])
                         .result(distinct: true)
    respond_to do |format|
      format.html {}
      format.json do
        @restaurants = @restaurants.limit(5)
        @fooditems = @fooditems.limit(5)
      end
    end
  end

  def location
    @addresses = Address.ransack(street_cont: params[:loc])
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
    adress = Address.where(street: params[:street]).pluck(:addressable_id)
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
