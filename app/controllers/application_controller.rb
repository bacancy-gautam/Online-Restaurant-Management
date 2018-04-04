# Application Controller
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?

  # before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :devise_parameter_sanitizer, if: :devise_controller?
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def devise_parameter_sanitizer
    if resource_class == DeliveryBoy
      DeliveryBoys::ParameterSanitizer.new(DeliveryBoy, :deliveryBoy, params)
    elsif resource_class == User
      Users::ParameterSanitizer.new(User, :user, params)
    end
  end

  private
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys:
  #                              [:username, :phoneno, :firstname, :lastname])
  # end

  # def user_not_authorized(exception)
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to root_path
  # end
end
