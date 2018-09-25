class OmmontessoriController < ApplicationController


  def index
    @ommontessori = Article.ommontessori
   
  end


end