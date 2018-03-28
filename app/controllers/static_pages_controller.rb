# Controller for Static Pages
class StaticPagesController < ApplicationController
  layout 'admin_panel', except: [:home, :about, :index, :contact]
  def home
    # @restaurant = Restaurant.find(params[:id])
  end

  def about; end

  def index; end

  def contact; end

  def my_account
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
  end
end
