# class policy for food-item module
class FoodItemPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?

  end

  def new?
    user.has_role? :admin
  end

  def create?
    true
  end

  def edit?
    user.has_role? :admin
  end

  def show?

  end

  def update?
    true
  end

  def destroy?
    user.has_role? :super_admin
  end

  def add_food_to_fav?
    user.has_role? :customer
  end

end
