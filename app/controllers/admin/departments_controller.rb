class Admin::DepartmentsController < Admin::ApplicationController
  

  def index
    @departments = Department.order(id: :asc)
  end

 
  def show

  end

  def new
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to edit_admin_department_url(@department), notice: 'Avdelingen er opprettet.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    @department = Department.find(params[:id])
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to edit_admin_department_url(@department), notice: 'Avdelingen er oppdatert.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    respond_to do |format|
      format.html { redirect_to admin_departments_url, notice: 'Avdelingen er slettet fra databasen.' }
      format.json { head :no_content }
    end
  end

  private 
    def department_params
      params.require(:department).permit(:name, :description, :contactperson, :email, :telephone, :school_id, :image, :titlecolor, :backgroundcolor)
    end
end
