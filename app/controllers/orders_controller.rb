# Controller for Orders
class OrdersController < ApplicationController
  # before_action :current_order
    protect_from_forgery except: :list_session_orders


  def new
    @order = Order.new
  end

  def create
    OrderHandler.new(params, session).manage_order
    if !session[:order].nil?
      @orders=Order.where(:id=>session[:order].keys).includes(:food_item)
    else
      @orders = []
    end
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def remove
    @order = Order.find(params[:order_id])
    qty = 0
    qty = @order.quantity if @order
    if qty > 1
      qty = qty - 1
      @order.update_attributes(quantity: qty, price: qty * @order.food_item.price.to_i)
    else 
      session[:order][@order.id.to_s] = nil
      @order.destroy
    end
    if !session[:order].nil?
      @orders=Order.where(:id=>session[:order].keys).includes(:food_item)
    else
      @orders = []
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
    if !session[:order].nil?
      @orders=Order.where(:id=>session[:order].keys).includes(:food_item)
    else
      @orders = []
    end
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def show_cart
    if !session[:order].nil?
      @orders=Order.where(:id=>session[:order].keys).includes(:food_item)
    else
      @orders = []
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:order_datetime, :quantity,
                                  :price, :food_item_id)
  end
end
