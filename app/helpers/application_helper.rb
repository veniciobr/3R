module ApplicationHelper
	# set R_HOME if not set
  	if ENV['R_HOME'].nil?
    	ENV['R_HOME'] = "/usr/lib/R"
  	end

	def resource_name
	  :user
	end

	def resource
	  @resource ||= User.new
	end

	def devise_mapping
	  @devise_mapping ||= Devise.mappings[:user]
	end
end
