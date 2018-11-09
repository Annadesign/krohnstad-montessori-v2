class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	layout 'application'
	before_action :authorize

	def current_parent
		@parent ||= Parent.find(session[:current_parent_id]) if session[:current_parent_id]
	end

	def Xcurrent_parent
  		@parent ||= Parent.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end

	def authorize
		unless current_parent
			
			#redirect_to logginn_url
			
		end
	end

	def to_bool string
		ActiveRecord::Type::Boolean.new.type_cast_from_user(string)
	end	
end
