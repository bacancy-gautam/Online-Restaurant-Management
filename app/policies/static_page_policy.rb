# class policy for static_page module
class StaticPagePolicy < ApplicationPolicy
  # scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def home?

  end

  def about?

  end

  def index?

  end

  def my_account?

  end

end
