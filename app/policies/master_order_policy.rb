# class policy for master order module
class MasterOrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
