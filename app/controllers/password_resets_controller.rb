class PasswordResetsController < ApplicationController
	def create
	  parent = Parent.find_by_email(params[:email])
	  parent.send_password_reset if parent
	  redirect_to root_url, :notice => "Epost er sendt med lenke til passordgjenoppretting."
	end

	def edit
	  @parent = Parent.find_by_password_reset_token!(params[:id])
	end

	def update
	  @parent = Parent.find_by_password_reset_token!(params[:id])
	  if @parent.password_reset_sent_at < 10.hours.ago
	    redirect_to new_password_reset_path, :alert => "Passordgjenoppretting er utløpt."
	  elsif @parent.update_attributes(params[:parent])
	    redirect_to root_url, :notice => "Password has been reset!"
	  else
	    render :edit
	  end
	end
end
