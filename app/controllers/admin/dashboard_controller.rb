class Admin::DashboardController < Admin::ApplicationController
  
  def index
  	@schools = School.all
  	@departments = Department.all
  	#@children = Child.all
  	#@parents = Parent.all
  end

end
