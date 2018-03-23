# class policy for master-offer module
class MasterOfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
