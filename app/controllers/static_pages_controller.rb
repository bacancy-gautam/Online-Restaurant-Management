# Controller for Static Pages
class StaticPagesController < ApplicationController
  layout 'admin_panel', except: [:home, :about, :index, :contact]
  def home
    # @restaurant = Restaurant.find(params[:id])
    @restaurant = Restaurant.all.includes(:address).sample(3)
  end

  def about; end

  def index; end

  def contact; end

  def my_account
    # @restaurant = Restaurant.new
    # @restaurants = Restaurant.all
    # @delivery_boy = DeliveryBoy.new
    # @delivery_boys = DeliveryBoy.all
    # @categories = Category.all
    # @category = Category.new
    # @fooditems = FoodItem.all
    # @fooditem = FoodItem.new
    # @order = Order.new
    # @orders = Order.all
    # @offer = Offer.new
    # @role = Role.all

    @users = User.all
    @restaurant = Restaurant.new
    @delivery_boy = DeliveryBoy.new
    @delivery_boys = DeliveryBoy.all
    @categories = Category.all
    @category = Category.new
    @fooditems = FoodItem.all
    @fooditem = FoodItem.new
    @order = Order.new
    @orders = Order.all
    @offer = Offer.new
    @restaurants = Restaurant.all
  end
end
