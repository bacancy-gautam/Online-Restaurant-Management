class OrdersController < ApplicationController
	 before_action :authenticate_user!
  def new
  	@order=Order.new
  end
  def create
  	current_order
  	#@master_order=session[:master_order_id]
  	puts "-------------------------------------------------------"
  		@order=session[:master_order_id].orders.create(order_params)
  		puts "#{@order.errors.full_messages}"
  		puts "---------------------------------------------"
  
  		exit
  	
  end
  def index
  end
  def edit
  end
  def show
  end
  private
  def current_order
  	if !session[:master_order_id].nil?
  		puts "----------------------sessionstart-----------------------"
      MasterOrder.find(session[:master_order_id])
      puts "=====#{master_order.find(session[:master_order_id]).inspect}====="
    else
      @master_order=MasterOrder.create(user_id:current_user.id)

      session[:master_order_id]=@master_order
    end
  end
  def order_params
  end
end
