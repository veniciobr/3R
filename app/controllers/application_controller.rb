class ApplicationController < ActionController::Base
  
  # User autentication
  # before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Make R instance available to all
  def InitR
   	 	@r = RSRuby.instance
    	return @r
	end

end
