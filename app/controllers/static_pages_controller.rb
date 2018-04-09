# Controller for Static Pages
class StaticPagesController < ApplicationController
  layout 'admin_panel', except: [:home, :about, :index, :contact]
  before_action :force_json, only: :search_in_admin 
  def home
    # @restaurant = Restaurant.find(params[:id])
    @restaurant = Restaurant.all.includes(:address).sample(3)
  end

  def about; end

  def index; end

  def contact; end

  def my_account; end

  private 

    def force_json 
      request.format = :json 
    end 
end
