class ApplicationController < ActionController::Base
#module ApplicationController
#  class ApplicationController < ActionController::Base

    # User autentication
    # before_action :authenticate_user!

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    #before_action :authenticate_user!
    before_action :authenticate_user!, :except => [:some_action_without_auth] 
    before_action :configure_permitted_parameters, if: :devise_controller?

    # Make R instance available to all
    def InitR
     	 	@r = RSRuby.instance
      	return @r
  	end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up)
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :administrator, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :administrator, :email, :current_password, :password, :password_confirmation) }
    end 
 # end
end
