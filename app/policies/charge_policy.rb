# class policy for charges module
class ChargePolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
   (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end

  def create?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer)
  end
end
