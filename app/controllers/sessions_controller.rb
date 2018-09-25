class SessionsController < ApplicationController
  before_action :authorize, except: [:index, :create]

  def new
    redirect_to parents_url if current_parent
  end

  def index
    @parent = Parent.find_by(name: params[session[:current_parent_id]])
  end

  def create
    @parent = Parent.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @parent
      
      session[:current_parent_id] = @parent.id
      redirect_to forum_url
    
    else
      
      flash[:alert] = 'Det er et problem med brukernavn eller passord'
      render :index

    end

  end

  def destroy
    session[:current_parent_id] = nil
    redirect_to root_url
  end
end
