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
    user.has_role? :admin
  end

  def show?
    true
  end

  def edit?
    user.has_role? :admin
  end

  def index?
    true
  end

  def update?
    user.has_role? :admin
  end
end
