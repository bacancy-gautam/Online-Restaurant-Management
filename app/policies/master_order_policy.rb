# class policy for master order module
class MasterOrderPolicy < ApplicationPolicy
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

  def index?

  end

  def destroy?

  end

  def edit?

  end

  def show?

  end

  def bill_details?

  end

end
