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
  	exit
  end
  def index
  end
  def edit
  end
  def show
  end
  private
  
  def order_params
  	params.require(:orders).permit(:)
  end
end
