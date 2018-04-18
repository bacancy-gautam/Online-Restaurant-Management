# Charges Controller
class ChargesController < ApplicationController
  def new 
    authorize MasterOrder, :index?
  end

  def create
    authorize MasterOrder, :index?
    # Amount in cents
    @amount = MasterOrder.find(params[:m_id]).total.to_i
    error_message = ChargesHandler.new(params, @amount).manage_charges
    if current_user.has_role? 'customer'
      error_message.nil? ? (redirect_to master_orders_path) : (redirect_to new_charge_path)
    else
      error_message.nil? ? (redirect_to  my_orders_master_orders_path ) : (redirect_to new_charge_path)
    end
  end
end
