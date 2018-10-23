class Admin::MeetingsController < Admin::ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end


  def show

  end

  def new
    @meeting = Meeting.new(:department_id => params[:department_id])
  end

  def edit
  end

  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to edit_admin_department_url(@meeting.department.id), notice: 'Hendelsen er lagt til.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to edit_admin_department_url(@meeting.department.id), notice: 'Hendelsen er oppdatert.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to admin_meetings_url, notice: 'Hendelsen er slettet.' }
      format.json { head :no_content }
    end
  end

  private
 
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :department_id)
    end
end
