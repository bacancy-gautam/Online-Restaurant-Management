class OffersController < ApplicationController
  def show
  end

  def index
  end

  def new
    @offer=Offer.new
    @restaurant=Restaurant.where(user_id: current_user.id).first
  end

  def edit
  end
end
