# class policy for charges module
class ChargePolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end
  def new?

  end

  def create?
  end
end
