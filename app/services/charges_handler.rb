# service for charges controller
class ChargesHandler
  attr_accessor :params
  def initialize(params, amount)
    @params = params
    @amount = amount
  end

  def manage_charges
    customer_create
    charges_create
    order_crete
    error_handle
  end

  private

  def customer_create
    @customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
  end

  def charges_create
    charge = Stripe::Charge.create(
      customer:    @customer.id,
      amount:      @amount,
      description: 'Rails Stripe customer',
      currency:    'usd'
    )
  end

  def error_handle
  rescue Stripe::CardError => e
    flash[:error] = e.message
    'new_charge_path'
  end

  def order_crete
    @order = MasterOrder.find(params[:m_id])
    @order.payment_status = 'paid'
    if @order.order_type == 'pickup'
      @order.order_status = 'completed'
    end
    @order.save
  end
end
