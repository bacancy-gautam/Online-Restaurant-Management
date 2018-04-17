# class policy for home_delivery_delivery_boy Policy module
class HomeDeliveryDeliveryBoyPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def new?
    (user.has_role? :super_admin)
  end

  def create?
    (user.has_role? :super_admin)
  end

  def get_home_delivery?
    (user.has_role? :delivery_boy)
  end

  def edit?
    (user.has_role? :super_admin)
  end

  def show?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer) || (user.has_role? :delivery_boy)
  end

end
