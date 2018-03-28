module Users
  # ParameterSanitizer for User Devise
  class ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      puts "-------------------------------#{@params}=========="
      #binding.pry
      @params.permit(:sign_up, keys: [:firstname, :lastname, :username, :phoneno])
    end
  end
end
