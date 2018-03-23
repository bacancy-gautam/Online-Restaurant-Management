# class policy for offer module
class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
