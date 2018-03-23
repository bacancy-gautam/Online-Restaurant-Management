# class policy for restaurant table module
class RestaurantTablePolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end
end
