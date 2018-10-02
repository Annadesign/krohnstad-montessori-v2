class BarnehagenController < ApplicationController


  def index
    @barnehagen = Article.barnehagen

   
  end

  def show
  	@barnehage = Article.find(params[:id])
  end


end