class InformasjonController < ApplicationController


  def index
    @informasjon = Article.informasjon

    @info1 = Article.find(5)
    @info2 = Article.find(6)


    #@localhost
   	#@info1 = Article.find(12)
    #@info2 = Article.find(13)    


   
  end


end