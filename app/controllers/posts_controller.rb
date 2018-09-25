class PostsController < ApplicationController

	def index
		@parents = Parent.all
	end

end