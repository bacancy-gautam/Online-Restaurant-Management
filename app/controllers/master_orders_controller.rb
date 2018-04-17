# Controller for Master Order
class MasterOrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :bill_details]

  def new
    authorize MasterOrder, :new?
    @address = Address.new
    @addresses = Address.where(addressable_id: current_user.id) if current_user
    @orders = []
    order_key = session[:order].keys
    order_key.each do |i|
      @orders << Order.find_by(id: i) unless Order.find_by(id: i).nil?
    end
    # order_key = session[:order].keys
    # order_key.each do |i|
    #   @order << Order.find_by(id: i) unless Order.find_by(id: i).nil?
    # end
    # session[:order].reject{|c| puts "true" if session[:order][c]==nil}
  end

  def create

    authorize MasterOrder, :create?

    order_types = MasterOrder.order_types.keys
      payment_types = MasterOrder.payment_types.keys
    @orders = Order.find(session[:order].compact.keys)
    @restaurants = Restaurant.find(@orders.pluck(:restaurant_id).uniq)
    @restaurants.each do |r|
      @m = MasterOrderHandler.new(params, session, current_user, r.id).manage_master_order
    end
    if @m.order_type == 'pickup' && @m.payment_type == 'card'
      @m.update_attribute(:order_status, 'ready')
    end
    redirect_path = if @m.order_type == 'home delivery'
                      new_home_delivery_path(master_order: @m)
                    else static_pages_my_account_path
                    end
    redirect_to redirect_path
  end

  def index
    restaurants = current_user.restaurants
    @master_orders = [] 
    @masters = MasterOrder.all 
    @master_orders = @masters if current_user.has_role? "super_admin"
    @masters.each do |master|
      if master.order_type == 'pickup' && master.payment_status == 'paid'
        master.update_attribute(:order_status, 'completed')
      end
      if current_user.has_role? "admin"
        restaurants.include?(master.restaurant_id) ? @master_orders << master : @master_orders
      elsif current_user.has_role? "customer"
        master.user_id == current_user.id ? @master_orders << master : @master_orders
      end
    end
 
  end

  def destroy
    authorize MasterOrder, :destroy?
    @master_order = MasterOrder.find(params[:id])
    @master_order.destroy
    redirect_to master_orders_path
  end

  def edit
    skip authorizated
  end

  def show
    authorize MasterOrder, :show?
    @master_order = MasterOrder.find(params[:id])
    # a = session[:order].compact.keys
    # @order = []
    # a.each do |i|
    # @order << Order.find_by(id: i) if Order.find_by(id: i) != nil
    # end
  end

  def bill_details
    authorize MasterOrder, :bill_details?
    @master_order = MasterOrder.new
    @orders = if !session[:order].nil?
                Order.where(id: session[:order].keys).includes(:food_item)
              else
                []
              end
  end

  def show_history
    @master_order = MasterOrder.find(params[:id])
    @orders = @master
  end

  private

  def master_order_params
    params.require(:master_order).permit(:total, :order_type, :payment_type,
                                         :order_status, :payment_status,
                                         :transaction_id, :user_id)
  end
end
