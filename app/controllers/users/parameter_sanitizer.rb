module Users
  # ParameterSanitizer for User Devise
  class ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      devise_parameter_sanitizer.permit(:sign_up, keys:
                                        [:username, :phoneno,
                                         :firstname, :lastname])
    end
  end
end
