class PostsController < ApplicationController

	def index
		@forside = Article.forside

	end

end