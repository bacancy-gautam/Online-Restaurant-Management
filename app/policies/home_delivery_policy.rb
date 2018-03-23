# class policy for home-delivery module
class HomeDeliveryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
