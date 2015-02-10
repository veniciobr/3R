module ApplicationHelper
	# set R_HOME if not set
  	if ENV['R_HOME'].nil?
    	ENV['R_HOME'] = "/usr/lib/R"
  	end
  	
  	#flash[:notice] = "Informações salvas com sucesso."
	#flash[:warning] = "Preencha todos os campos obrigatórios."
	#flash[:error] = "Não foi possível salvar as informações."
	#flash[:info] = "Você tem mensagens não visualizadas."  	
  	
	def flash_message
		messages = ""
	    [:notice, :info, :warning, :error].each {|type|
	    if flash[type]
	      	case type.to_s 
	      	when 'notice'
	        	messages += "<div class=\"alert alert-success\" role=\"alert\">#{flash_messageh[type]}</div>"
	        when 'warning'
	        	messages += "<div class=\"alert alert-warning\" role=\"alert\">#{flash[type]}</div>"
		    when 'error'
		        messages += "<div class=\"alert alert-danger\" role=\"alert\">#{flash[type]}</div>"
			when 'info'
			    messages += "<div class=\"alert alert-info\" role=\"alert\">#{flash[type]}</div>"
			else
			    messages += "#{type}<div class=\"alert alert-info\" role=\"alert\">#{flash[type]}</div>"
			end
		end
	    }
	    messages.html_safe
	end

	def setPath(id,subdir)

		path="/home/bioall/3R/rnarrails/Analysis/#{id}/#{subdir}/"
		
	end

	#def resource_name
	#  :user
	#end

	#def resource
	#  @resource ||= User.new
	#end

	#def devise_mapping
	#  @devise_mapping ||= Devise.mappings[:user]
	#end
end
