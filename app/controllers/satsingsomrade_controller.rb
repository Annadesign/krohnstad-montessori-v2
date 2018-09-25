class SatsingsomradeController < ApplicationController


  def index
    @satsingsomrade = Article.satsingsomrade
   
  end


end