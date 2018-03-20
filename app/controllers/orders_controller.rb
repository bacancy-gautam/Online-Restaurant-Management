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
  	  	@order= Order.create(order_params)
  	  	puts ""
  	  		# puts "------------------#{@order.errors.full_messages}"
  	session[:order]=@order
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
  end
end
