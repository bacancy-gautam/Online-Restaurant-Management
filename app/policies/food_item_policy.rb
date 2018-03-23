# class policy for food-item module
class FoodItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
