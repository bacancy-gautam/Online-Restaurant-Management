# Controller for Orders
class OrdersController < ApplicationController
  # before_action :current_order

  def new
    @order = Order.new
  end

  def create
    session[:order] = {} if session[:order].blank?
    food_item=FoodItem.find(params[:food_item])
    restaurant=Restaurant.find(params[:restaurant_id])
    
    if (Order.where(food_item_id:food_item.id).count!=0)
      @orders=Order.where(food_item_id:food_item.id).last
      if(session[:order].compact.include?(@orders.id))
        qty = @orders.quantity + 1
      else
        qty = 1
      end
      @orders.update_attribute(:quantity,qty)
      @orders.update_attribute(:price,(qty*food_item.price.to_i))
      @order=@orders
    else
   
    @order = Order.create(order_datetime:Time.now,price:food_item.price.to_i,food_item_id:food_item.id,quantity:1,restaurant_id:restaurant.id)
    # @order.update_attribute(:food_item_id, food_item.id)
    #@order.update_attribute(:price, @order.food_item.price.to_i)
    # @order.update_attribute(:order_datetime, Time.now)
  
    end
    session[:order][@order.id] = { order_id: @order.id,
                                   quantity: @order.quantity,
                                   price: @order.price.to_i }

    # session[:order] || = @order
  end

  def index
    @orders = Order.all
  end

  def edit
   end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    session[:order][@order.id.to_s] = nil
    @order.destroy
    
  end

  private

  def order_params
    params.require(:order).permit(:order_datetime, :quantity,
                                  :price, :food_item_id)
  end
end
