# class policy for chart module
class ChartPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def super_admin_new_users?
    user.has_role? :super_admin
  end

  def super_admin_food_items?
    user.has_role? :super_admin 
  end

  def super_admin_orders?
    user.has_role? :super_admin
  end

  def super_admin_revenue?
    user.has_role? :super_admin
  end

  def admin_orders?
    user.has_role? :admin
  end

  def admin_revenue?
    user.has_role? :admin
  end

end
