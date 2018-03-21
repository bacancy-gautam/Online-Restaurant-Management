class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

#before_action :configure_permitted_parameters, if: :devise_controller?


  before_action :devise_parameter_sanitizer, if: :devise_controller?
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protected

  def devise_parameter_sanitizer
    if resource_class == DeliveryBoy
      DeliveryBoys::ParameterSanitizer.new(DeliveryBoy, :deliveryBoy, params)
    else
      super # Use the default one
    end
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phoneno, :firstname, :lastname])
  # end

  # def user_not_authorized(exception)
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to root_path
  # end
end
