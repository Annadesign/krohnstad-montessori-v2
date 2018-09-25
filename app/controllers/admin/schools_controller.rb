class Admin::SchoolsController < Admin::ApplicationController
  before_action :set_admin_school, only: [:show, :edit, :update, :destroy]

 
  def index
    @schools = School.order(id: :asc)

    #@categories = Category.find(:all, :include => :posts).where(:published => :true) # you may specify your conditions here
  # :include is needed to avoid a query on each "category.posts" call later in the view
  end

 
  def show

  end

  def new
    @school = School.new
  end

  def edit

  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to admin_schools_url@school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to edit_admin_school_url@school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dschool = School.find(params[:id])
    @school.destroy
    respond_to do |format|
      format.html { redirect_to admin_schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :description)
    end
end
