# Controller for Static Pages
class StaticPagesController < ApplicationController
	layout "admin_panel", except: [:home,:about,:index,:contact]
  def home
    # @restaurant = Restaurant.find(params[:id])
  end

  def about; end

  def index; end

  def contact; end

  def my_acoount
  	
  end
end
