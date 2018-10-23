class Admin::ChildrenController < Admin::ApplicationController
  

  def index
    @children = Child.order(lastname: :asc, birthdate: :asc)
  end

 
  def show

  end

  def new
    @child = Child.new
  end

  def edit
    @child = Child.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @child = Child.new(child_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to admin_children_url, notice: 'Barnet er registrert' }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    @child = Child.find(params[:id])
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to edit_admin_child_url(@child), notice: 'Barnets informasjon er oppdatert' }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    respond_to do |format|
      format.html { redirect_to admin_children_url, notice: 'Barnets informasjon er slettet fra databasen.' }
      format.json { head :no_content }
    end
  end

  private 
    def child_params
      params.require(:child).permit(:id, :firstname, :lastname, :birthdate, :department_id, :parent_id, 
                                    parent_ids: []
                                  )
    end
end
