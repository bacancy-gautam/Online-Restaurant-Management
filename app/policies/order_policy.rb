# class policy for order module
class OrderPolicy < ApplicationPolicy
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

  def remove?

  end

  def index?

  end

  def edit?

  end

  def show?

  end

  def destroy?

  end

  def show_cart?

  end

end
