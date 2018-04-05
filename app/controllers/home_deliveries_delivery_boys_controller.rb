# controller of homedelivery_deliveryboys
class HomeDeliveriesDeliveryBoysController < ApplicationController
  def index
    @home_deliveries = HomeDelivery.all
  end

  def new
    $home_delivery = HomeDelivery.find(params[:home_delivery])
  end

  def create
    @delivery = params[:delivery_boy_ids]
    if @delivery.nil?
      render 'new'
    else
      @delivery_boy = DeliveryBoy.find(@delivery[:id])
      $home_delivery.delivery_boys << @delivery_boy
      $home_delivery.update_attribute(:status, 'assigned')
      $home_delivery.master_order.update_attribute(:order_status, 'ready')
      @delivery_boy.update_attribute(:status, 'busy')
      redirect_to home_deliveries_delivery_boys_path
    end
  end

  def edit; end

  def show; end
end
