# class policy of address module
class AddressPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
