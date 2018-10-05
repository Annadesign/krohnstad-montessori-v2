class PersonvernController < ApplicationController


  def index
    @personvern = Article.personvern

   
  end

  def show
  	@personvern = Article.find(params[:id])
  end


end