class Admin::ParentsController < Admin::ApplicationController

	def index
		@parents = Parent.order(name: :asc)
	end

	def new
    	@parent = Parent.new
    end

	def edit
		@parent = Parent.find(params[:id])
	end

	def create

    	@parent = Parent.new(parent_params)
    	respond_to do |format|
      		if @parent.save
        		format.html { redirect_to admin_parents_url, notice: 'Foresatt' + parent_params[:name] + 'ble opprettet.' }
        		format.json { render :show, status: :created, location: @parent }
      		else
       			format.html { render :new }
        		format.json { render json: @parent.errors, status: :unprocessable_entity }
      		end
    	end
  	end

	def update
		@parent = Parent.find(params[:id])

		if 	@parent.update(parent_params)
			flash[:notice] = "parent was successfully updated."
			redirect_to admin_parents_url
		else
			flash[:alert] = "There was a problem updating parent."
			render 'edit'
		end

	end

	private
		def parent_params
			params.require(:parent).permit(:id, :name, :email, :telephone, :password)
		end
end