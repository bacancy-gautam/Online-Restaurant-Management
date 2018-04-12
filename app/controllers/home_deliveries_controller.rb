# Home_delivery controller
class HomeDeliveriesController < ApplicationController
  def new
    @home_delivery = HomeDelivery.new
    @master_order = MasterOrder.find(params[:master_order])
  end

  def create
    @master_order = MasterOrder.find(params[:master_order_id])
    @home_delivery = @master_order.create_home_delivery(home_delivery_params)
    @home_delivery.update_attribute(:status, 'pending')
    redirect_to static_pages_my_account_path
  end

  def add_address
    @address = Address.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @home_deliveries = HomeDelivery.all.includes(:master_order, :address)
  end

  def change_home_delivery_status; end

  def edit
    @home_delivery = HomeDelivery.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @home_delivery = HomeDelivery.find(params[:id])
    @home_deliveries = current_delivery_boy.home_deliveries
    if @home_delivery.update_attributes(home_delivery_params)
      master_order = @home_delivery.master_order
     master_order.update_attribute(:order_status, @home_delivery.status)

      flash[:success] = 'Status updated!'
      respond_to do |format|
        format.html do
          render(partial: 'home_deliveries_delivery_boys/home_deliveries')
        end
        format.js
      end
    else
      render 'edit'
    end
  end

  def show; end

  private

  def home_delivery_params
    params.require(:home_delivery).permit(:status, :address_id, :master_order_id)
  end
end
