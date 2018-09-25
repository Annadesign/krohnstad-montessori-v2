class InformasjonController < ApplicationController


  def index
    @informasjon = Article.informasjon
   
  end


end