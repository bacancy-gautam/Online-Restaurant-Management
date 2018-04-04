class HomeDeliveriesController < ApplicationController
  def new
    @home_delivery = HomeDelivery.new
    $master_order = MasterOrder.find(params[:master_order])
  end

  def create
    @home_delivery = $master_order.create_home_delivery(home_delivery_params)
    @home_delivery.save
    @home_delivery.update_attribute(:status, 'pending')
    redirect_to master_orders_path
  end

  def index
    @home_deliveries = HomeDelivery.all
  end

  def edit
  end


  def edit_status
    @home_delivery = HomeDelivery.find(params[id])
    redirect_to 
  end

  def show
  end

  private 

  def home_delivery_params
    params.require(:home_delivery).permit(:status,:address_id,:master_order_id)
  end 
end
