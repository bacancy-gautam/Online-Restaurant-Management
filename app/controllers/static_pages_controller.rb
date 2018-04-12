# Controller for Static Pages
class StaticPagesController < ApplicationController
  layout 'admin_panel', except: [:home, :about, :index, :contact]
  def home
    # @restaurant = Restaurant.find(params[:id])
    @restaurants = Restaurant.all.includes(:address, :offers).sample(3)
  end

  def about; end

  def index; end

  def my_account; end
end
