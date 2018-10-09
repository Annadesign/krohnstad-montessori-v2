class InformasjonController < ApplicationController


  def index
    @informasjon = Article.informasjon

    @school = School.all


   
  end


end