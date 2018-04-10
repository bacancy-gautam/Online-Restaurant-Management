# Controller for Master Order
class MasterOrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :bill_details]

  def new
    @master_order = MasterOrder.new
    @address = Address.new
    @addresses = Address.where(addressable_id: current_user.id) if current_user
    @orders = []
    order_key = session[:order].keys
    order_key.each do |i|
      @orders << Order.find_by(id: i) unless Order.find_by(id: i).nil?
    end
  end

  def create
    @orders = Order.find(session[:order].compact.keys)
    @restaurants = Restaurant.find(@orders.pluck(:restaurant_id).uniq)
    @restaurants.each do |r|
      @m = MasterOrderHandler.new(params, session, current_user, r.id).manage_master_order
    end
    redirect_path = if @m.order_type == 'home delivery'
                      new_home_delivery_path(master_order: @m)
                    else master_orders_path
                    end
    redirect_to redirect_path
  end

  def index
    @master_orders = MasterOrder.where(user_id: current_user.id)
  end

  def destroy
    @master_order = MasterOrder.find(params[:id])
    @master_order.destroy
    redirect_to master_orders_path
  end

  def edit; end

  def show
    @master_order = MasterOrder.find(params[:id])
    # a = session[:order].compact.keys
    # @order = []
    # a.each do |i|
    # @order << Order.find_by(id: i) if Order.find_by(id: i) != nil
    # end
  end

  def bill_details
    @master_order = MasterOrder.new
    @orders = if !session[:order].nil?
                Order.where(id: session[:order].keys).includes(:food_item)
              else
                []
              end
  end

  private

  def master_order_params
    params.require(:master_order).permit(:total, :order_type, :payment_type,
                                         :order_status, :payment_status,
                                         :transaction_id, :user_id)
  end
end
