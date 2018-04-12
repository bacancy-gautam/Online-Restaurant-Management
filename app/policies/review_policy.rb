# class policy for review module
class ReviewPolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?

  end

  def edit?

  end

  def update?

  end

  def review_edit?

  end

  def review_update?

  end

  def destroy?

  end

  def index?

  end

  def review_delete?

  end

end
