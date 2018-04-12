# Contoller for Charts
class ChartsController < ApplicationController

  def super_admin_new_users
    render json: User.group_by_week(:created_at).count
  end

  def super_admin_food_items
    render json: FoodItem.group(:restaurant_id).count
  end

  def super_admin_orders
    render json: MasterOrder.group_by_week(:created_at).count
  end

  def super_admin_revenue
    render json: MasterOrder.group_by_week(:created_at).sum(:total)
  end

  def admin_orders
    render json: MasterOrder.where(restaurant_id: current_user.restaurants.ids).group_by_week(:created_at).count
  end

  def admin_revenue
    render json: MasterOrder.where(restaurant_id: current_user.restaurants.ids).group_by_week(:created_at).sum(:total)
  end

end
