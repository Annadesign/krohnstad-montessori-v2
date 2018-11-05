class SessionsController < ApplicationController
  before_action :authorize, except: [:index, :create]

  def new
    redirect_to parents_url if current_parent
  end

  def index
    @parent = Parent.find_by(name: cookies[:auth_token])
  end

  def create
    @parent = Parent.find_by(email: params[:email]).try(:authenticate, params[:password])

    if @parent
      #session[:current_parent_id] = @parent.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = @parent.auth_token
      else
        cookies[:auth_token] = @parent.auth_token
      end

      redirect_to forum_url
    
    else
      
      flash[:alert] = 'Det er et problem med brukernavn eller passord'
      render :index

    end

  end

  def destroy
    cookies.delete(:auth_token)
    session[:current_parent_id] = nil
    redirect_to root_url
  end
end
