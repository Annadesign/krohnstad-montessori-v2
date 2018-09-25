class ChildrenController < ApplicationController

	def index
		@children = Child.all
		#@parent = Parent.find(session[:current_parent_id]) if session[:current_parent_id]
	end
	
end