# class policy for restaurant_category module
class RestaurantscategoryPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.has_role? :admin
  end

  def create?
    true
  end

  def show?

  end

  def edit?
    user.has_role? :admin
  end

  def index?

  end

  def update?
    true
  end
end
