# Controller for Orders
class OrdersController < ApplicationController
  # before_action :current_order

  def new
    @order = Order.new
  end

  def create
    OrderHandler.new(params, session).manage_order
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def index
    @orders = Order.all
  end

  def edit; end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    session[:order][@order.id.to_s] = nil
    @order.destroy
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_datetime, :quantity,
                                  :price, :food_item_id)
  end
end
