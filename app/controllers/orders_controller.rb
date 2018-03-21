class OrdersController < ApplicationController
	before_action :authenticate_user!
	 #before_action :current_order
  def new
    @order=Order.new
  end
  def create
  	# current_order
  	# @master_order=session[:master_order_id]
  	# master_id=session[:master_order_id]["id"]
  	# masterorder=MasterOrder.find(master_id)
  	# puts "-------------------------------------------------------"
  	# 	@order=masterorder.orders.create(order_params)
  	# 	puts "#{@order.errors.full_messages}"
  	# 	puts "---------------------------------------------"
  	# 	exit  
  	if session[:order].blank?
   		session[:order]={}
 		end
  	@order= Order.create(order_params)
  	# puts "------------------#{@order.errors.full_messages}"
  	session[:order][@order.id]= {order_id:@order.id,quantity:@order.quantity}
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
    @order.destroy
    session[:order]["@order.id"]
    exit  
    redirect_to orders_path
  end
  private
  def order_params
  	params.require(:order).permit(:order_datetime,:quantity,:price,:food_item_id)
  end
end
