# Controller for Master Order
class MasterOrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @master_order = MasterOrder.new
    a = session[:order]
    # session[:order].reject{|c| puts "true" if session[:order][c]==nil}
  end

  def create
    a = []
    @order = []
    a = session[:order].keys
    a.each do |i|
      @order << Order.find_by(id: i) if Order.find_by(id: i) != nil
    end

    sum = 0
    @order.each do |o|
      sum += (o.price.to_i * o.quantity)
    end

    @master_order = MasterOrder.create(master_order_params)
    @master_order.update_attribute(:total, sum)
    @master_order.update_attribute(:user_id, current_user.id)
    redirect_to master_orders_path
  end

  def index
    @master_orders = MasterOrder.all
  end

  def destroy
    @master_order = MasterOrder.find(params[:id])
    @master_order.destroy
    redirect_to master_orders_path
  end

  def edit; end

  def show
    @master_order = MasterOrder.find(params[:id])
    a = session[:order].keys
    @order = []
    a.each do |i|
      @order << Order.find_by(id: i) if Order.find_by(id: i) != nil
    end
  end

  private

  def master_order_params
    params.require(:master_order).permit(:total, :order_type, :payment_type,
                                         :order_status, :payment_status,
                                         :transaction_id, :user_id,
                                         :restaurant_id)
  end
end
