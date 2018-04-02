# Service for handling MasterOrders
class MasterOrderHandler
  attr_accessor :params

  def initialize(params, session, current_user)
    @params = params
    @session = session
    @current_user = current_user
  end

  def manage_master_order
    search_session_order
    create_master_order
    update_master_order
  end

  private

  def search_session_order
    @order = []
    order_key = @session[:order].compact.keys
    order_key.each do |i|
      @order << Order.find_by(id: i) unless Order.find_by(id: i).nil?
    end
  end

  def update_master_order
    total
    @master_order.update_attributes(
      total: sum,
      order_status: 'placed',
      payment_status: 'pending',
      user_id: @current_user.id
    )
    @session[:order] = nil
  end

  def create_master_order
    total
    @master_order = MasterOrder.create(master_order_params)
  end

  def total
    sum = 0
    orders = Order.where(restaurant_id: @master_order.restaurant_id)
    orders.find(@session[:order].compact.keys).each do |o|
      sum += o.price.to_i
    end
  end

  def master_order_params
    params.require(:master_order).permit(:total, :order_type, :payment_type,
                                         :order_status, :payment_status,
                                         :transaction_id, :user_id,
                                         :restaurant_id)
  end
end
