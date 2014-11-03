module ApplicationHelper
	# set R_HOME if not set
  	if ENV['R_HOME'].nil?
    	ENV['R_HOME'] = "/usr/lib/R"
  	end

end
