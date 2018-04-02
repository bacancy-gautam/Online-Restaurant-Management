# Controller for Master Order
class MasterOrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @master_order = MasterOrder.new
    @order = []
    order_key = session[:order].keys
    order_key.each do |i|
      @order << Order.find_by(id: i) unless Order.find_by(id: i).nil?
    end
    # session[:order].reject{|c| puts "true" if session[:order][c]==nil}
  end

  def create
    MasterOrderHandler.new(params, session, current_user).manage_master_order

    redirect_to master_orders_path
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

  private

  def master_order_params
    params.require(:master_order).permit(:total, :order_type, :payment_type,
                                         :order_status, :payment_status,
                                         :transaction_id, :user_id,
                                         :restaurant_id)
  end
end
