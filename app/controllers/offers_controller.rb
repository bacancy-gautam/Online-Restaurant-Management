# Controller for Offers
class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :update]

  def new
    @offer = Offer.new
    @restaurant = Restaurant.where(user_id: current_user.id).first
  end

  def create
    
    @offer = Offer.new(offer_params)
    if @offer.save
      @offers = Offer.all
      respond_to do |format|
        format.html { render(partial: 'index') }
        format.js { render 'index' }
      end
    else
      render 'new'
    end
  rescue ActiveRecord::RecordNotUnique
    flash[:notice] = 'All ready crate a offer'
    render :new
  end

  def change_foodlist
    @food = Restaurant.find(params[:food]).food_items
  end

  def index
    @offers = Offer.all
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  def show; end

  def update
    if @offer.update(offer_params)
      redirect_to offers_path
    else
      render 'new'
    end
  end
  # begin
  # params[:state]
  #  @state = CS.states(:in).key(params[:state])
  # end

  def edit
    @offer.restaurant_id = nil
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:restaurant_id, 
                                  :food_item_id, 
                                  :discount, 
                                  :start_date, 
                                  :end_date)
  end
end
