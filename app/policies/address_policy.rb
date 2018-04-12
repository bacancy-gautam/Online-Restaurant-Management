# class policy of address module
class AddressPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end
  def index?
    (user.has_role? :super_admin) || (user.has_role? :admin)
  end

  def new?
    (user.has_role? :admin) || (user.has_role? :customer) 
  end

  def create?
    true
  end

  def edit?
    (user.has_role? :admin) || (user.has_role? :customer)
  end

  def update?
    true
  end

  def change_city?
    (user.has_role? :admin) || (user.has_role? :customer)
  end

  def destroy?
    (user.has_role? :admin) || (user.has_role? :customer)
  end

  def view_address?
    (user.has_role? :admin) || (user.has_role? :customer)
  end
    
end
