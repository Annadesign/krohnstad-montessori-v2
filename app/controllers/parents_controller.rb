	class ParentsController < ApplicationController

	def index
		@parents = Parent.all
		@parent = Parent.find(session[:current_parent_id]) if session[:current_parent_id]
		@messages = Message.all

	end

	def show
				
	end

	def edit
		@parent = Parent.find(params[:id])
	end


	def update
		@parent = Parent.find(params[:id])
		if 	@parent.update(parent_params)
			flash[:notice] = "Dine opplysninger er oppdaterte."
			redirect_to edit_parent_url(@parent)
		else
			flash[:alert] = "En feil oppstod."
			render 'edit'
		end
	end

	private
		def parent_params
			params.require(:parent).permit(:id, :name, :email, :telephone, :password, :isverified, :auth_token, :password_reset_token, :password_reset_sent_at)
		end
end