class Admin::EventsController < Admin::ApplicationController
  
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(:department_id => params[:department_id])
    @event = Event.new

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private

    def set_department
      @department = Department.find(params[:department_id])
    end
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color, :department_id)
    end
end
