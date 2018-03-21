class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_super_admin
  def index
  end
  private
  def authenticate_super_admin
  		redirect_to '/', alert: 'Not authorized.' unless current_user.has_role? :super_admin
  end
end
