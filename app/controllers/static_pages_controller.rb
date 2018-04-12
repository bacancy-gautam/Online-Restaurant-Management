# Controller for Static Pages
class StaticPagesController < ApplicationController
  layout 'admin_panel', except: [:home, :about, :index, :contact]
  def home
    # @restaurant = Restaurant.find(params[:id])
    @restaurants = Restaurant.all.includes(:address).sample(3)
    skip_authorization
  end

  def about 
    skip_authorization
  end

  def my_account
    if current_delivery_boy.present?
      skip_authorization
    else
  	  authorize Category, :index?
    end
  end
end
