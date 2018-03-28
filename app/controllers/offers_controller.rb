class OffersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def index
  end
  def create
    @offer=Offer.new(offer_params)
    @offer.food_item_id=FoodItem.find_by(name:params[:food_id])
    exit
  end
  def new
    @offer=Offer.new
    @restaurant=Restaurant.where(user_id: current_user.id).first
  end
  def change_category
   @category=Restaurant.find(params[:category]).id
  end


  def change_foodlist
    name=params[:food]
    @food=Category.find_by(name: name).id
    
  end


=begin
params[:state]
    @state = CS.states(:in).key(params[:state])
=end

  def edit
  end
  private
  def offer_params
    params.require(:offer).permit(:quantity, :restaurant_id, :food_item_id)
  end
end
