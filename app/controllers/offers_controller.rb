class OffersController < ApplicationController
  def show
  end

  def index
  end

  def new
    @offer=Offer.new
    @restaurant=Restaurant.where(user_id: current_user.id).first
  end
  def change_category
   @category=Restaurant.find(params[:category]).id
  end
  def change_foodlist
   @food=Category.find_by(name: params[:category])

  end
=begin
params[:state]
    @state = CS.states(:in).key(params[:state])
=end

  def edit
  end
end
