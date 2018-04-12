# Charges Controller
class ChargesController < ApplicationController
  def new 
  end

  def create
    # Amount in cents
    @amount = MasterOrder.find(params[:m_id]).total.to_i
    error_message = ChargesHandler.new(params, @amount).manage_charges
    error_message.nil? ? (redirect_to master_orders_path) : (redirect_to new_charge_path)
  end
end
