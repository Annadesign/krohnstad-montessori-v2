class BarnehagenController < ApplicationController


  def index
    @barnehagen = Article.barnehagen

    @barnehage1 = Article.find(1)
    @barnehage12 = Article.find(12)
    @barnehage13 = Article.find(13)

   
  end

  def show
  	@barnehage = Article.find(params[:id])
  end


end