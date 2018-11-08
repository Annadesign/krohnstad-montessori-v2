class EventsController < ApplicationController

  def index
    @events = Event.where(:department_id => params[:department_id])
    @event = Event.new

  end
 
end
