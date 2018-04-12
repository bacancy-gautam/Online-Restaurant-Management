# class policy for chart module
class ChartPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def super_admin_new_users?

  end

  def super_admin_food_items?

  end

  def super_admin_orders?

  end

  def super_admin_revenue?

  end

  def admin_orders?

  end

  def admin_revenue?

  end

end
