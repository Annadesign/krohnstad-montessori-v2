class BarnehagenController < ApplicationController


  def index
    @barnehagen = Article.barnehagen
   
  end


end