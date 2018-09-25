class Admin::DashboardController < Admin::ApplicationController
  
  def index
  	@schools = School.all
  	@departments = Department.all
  	
  end
end
