class DepartmentsController < ApplicationController

	def index
		@departments = Department.all
		#@parent = Parent.find(session[:current_parent_id]) if session[:current_parent_id]
	end

	def show
		@department = Department.find(params[:id])
		if Info.any?
			@info = Info.first
		end
	end
	
end