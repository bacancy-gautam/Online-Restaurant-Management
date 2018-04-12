# class policy for home-delivery module
class HomeDeliveryPolicy < ApplicationPolicy
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

  def change_home_delivery_status?

  end

  def edit?

  end

  def update?

  end

  def show?

  end
end
