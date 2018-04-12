# class policy for restaurant module
class RestaurantPolicy < ApplicationPolicy
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

  def edit?
    
  end

  def update?
   
  end

  def show?
   
  end

  def food_by_category?
    
  end

  def index?

  end?

  def destroy?
   
  end

  def new_release?
   
  end

  def add_restaurant_to_fav?
    
  end

  def search?
   
  end

  def restaurant_list?
   
  end

  def change_restaurant_status?
   
  end

  def location?
   
  end

  def area_wise_restaurants?
    
  end
end
