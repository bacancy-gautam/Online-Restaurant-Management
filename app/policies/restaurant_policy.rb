# class policy for restaurant module
class RestaurantPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end
end
