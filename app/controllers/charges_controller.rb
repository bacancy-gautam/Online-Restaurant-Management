# Charges Controller
class ChargesController < ApplicationController
  def new; end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:    customer.id,
      amount:      @amount,
      description: 'Rails Stripe customer',
      currency:    'usd'
    )
    @order = MasterOrder.find(params[:m_id])
    @order.payment_status = 'paid'
    @order.save
    redirect_to master_orders_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
