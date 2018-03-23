# class policy for order module
class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
