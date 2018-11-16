class Admin::DashboardController < Admin::ApplicationController
  
  def index
  	@schools = School.all
  	@departments = Department.all
  	@info = Info.where("length(content) > 20")
  	#@parents = Parent.all
  end

end
