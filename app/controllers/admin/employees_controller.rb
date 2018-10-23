class Admin::EmployeesController < Admin::ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.by_name
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to admin_employees_path, notice: 'Ansatt er lagret.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to edit_admin_employee_url, notice: 'Ansatt er oppdatert.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to admin_employees_url, notice: 'Ansatt er slettet.' }
      format.json { head :no_content }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:lastname, :firstname, :email, :telephone, :position, :image, :description, :department_id)
    end
end
