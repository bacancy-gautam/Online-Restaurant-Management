# Charges Controller
class ChargesController < ApplicationController
  def new 
    authorize MasterOrder, :index?
  end

  def create
      authorize MasterOrder, :index?

      sum = 0
      session[:order].keys.each do |order|
       o= Order.find(order)
        sum = sum + o.price 
      end 
      @amount = sum.to_i

      error_message = ChargesHandler.new(params, @amount).manage_charges
      order_types = MasterOrder.order_types.keys
    payment_types = MasterOrder.payment_types.keys
    @orders = Order.find(session[:order].compact.keys)
    @restaurants = Restaurant.find(@orders.pluck(:restaurant_id).uniq)
    binding.pry
    @restaurants.each do |r|
      @m = MasterOrderHandler.new(params[:o_type],params[:p_type], session, current_user, r.id).manage_master_order

    end
    if @m.order_type == 'pickup' && @m.payment_type == 'card'
      @m.update_attribute(:order_status, 'ready')
    end
    redirect_path = if @m.order_type == 'home delivery'
                      new_home_delivery_path(master_order: @m)
                    else static_pages_my_account_path
                    end
    redirect_to redirect_path
   # if current_user.has_role? 'customer'
    #  error_message.nil? ? (redirect_to master_orders_path) : (redirect_to new_charge_path)
    #else
     # error_message.nil? ? (redirect_to  my_orders_master_orders_path ) : (redirect_to new_charge_path)

  
  end

  private

  def master_order_params
    params.require(:master_order).permit(:total, :order_type, :payment_type,
                                         :order_status, :payment_status,
                                         :transaction_id, :user_id)
  end
end
