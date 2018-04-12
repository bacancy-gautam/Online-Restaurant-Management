# class policy for order module
class OrderPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end
  def new?
    (user.has_role? :super_admin) || (user.has_role? :admin) || (user.has_role? :customer) ||(user==nil)
  end

  def create?

  end

  def remove?

  end

  def index?

  end

  def edit?

  end

  def show?

  end

  def destroy?

  end

  def show_cart?

  end

end
