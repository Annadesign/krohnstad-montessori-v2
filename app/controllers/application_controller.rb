class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	layout 'application'
	before_action :authorize

	def current_parent
		@parent ||= Parent.find(session[:current_parent_id]) if session[:current_parent_id]
	end

	def authorize
		unless current_parent
			unless request_uri = "/password_resets/new"

				redirect_to logginn_url
			end
			
		end
	end

	def to_bool string
		ActiveRecord::Type::Boolean.new.type_cast_from_user(string)
	end	
end
