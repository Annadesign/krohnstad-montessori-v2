class SkoleController < ApplicationController


  def index
    @skole = Article.skole
   
  end


end