class PostsController < ApplicationController

	def index
		@parents = Parent.all

		@article1 = Article.find(1)
		@article2 = Article.find(2)
		#localhost		
		#@article1 = Article.find(11)
		#@article2 = Article.find(6)
	end

end