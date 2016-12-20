class WelcomeController < ApplicationController

	before_action :new_user

	layout "welcome_layout"

  def index
  	if request.xhr?
  		@schools = School.by_location(params[:lat], params[:long])
  		if !@schools.empty?
  			render(:partial => 'schools/partials/schools', :layout => false, :locals => {:schools => @schools})
  		else
        # byebug
  			render :json => @schools
  		end
  	else
  		@schools = School.paginate(:page => params[:page])	
  	end
   	
  end

end
