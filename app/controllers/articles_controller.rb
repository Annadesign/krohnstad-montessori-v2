class ArticlesController < ApplicationController

	def index
		@articles = Article.sort(:position)
	end

end