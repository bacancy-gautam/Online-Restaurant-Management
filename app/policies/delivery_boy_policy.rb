# class policy for delivery_boy module
class DeliveryBoyPolicy < ApplicationPolicy
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

  def show?

  end

  def edit?

  end

  def update?

  end

  def change_delivery_boy_status?

  end

  def destroy?

  end

  def change_password_edit?

  end

  def change_password_update?

  end

end
