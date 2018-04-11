# class policy for food-item module
class FoodItemPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.has_role? :admin
  end

  def edit?
    user.has_role? :admin
  end

  def destroy?
    user.has_role? :admin
  end
end
