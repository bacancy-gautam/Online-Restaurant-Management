class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phoneno, :firstname, :lastname])
  end
end