class OrdersController < ApplicationController
	#before_action :current_order
  def new
    @order=Order.new
  end
  def create
  	if session[:order].blank?
   		session[:order]={}
 		end
  	@order= Order.create(order_params)
    @order.update_attribute(:price,@order.food_item.price.to_i)
   
  	# puts "------------------#{@order.errors.full_messages}"
  	session[:order][@order.id]= {order_id:@order.id,quantity:@order.quantity,price:@order.price.to_i}
  	#session[:order] || = @order
    redirect_to orders_path
  end
  def index
    @orders=Order.all
  end
  def edit
  end
  def show
    @order=Order.find(params[:id])
  end
  def destroy
    @order=Order.find(params[:id])  
    session[:order][@order.id.to_s]=nil
    @order.destroy
    redirect_to orders_path
  end
  private
  def order_params
  	params.require(:order).permit(:order_datetime,:quantity,:price,:food_item_id)
  end
end