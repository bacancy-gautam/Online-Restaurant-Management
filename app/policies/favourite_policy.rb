# class policy for favourite module
class FavouritePolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?

  end

  def destroy?

  end

end
