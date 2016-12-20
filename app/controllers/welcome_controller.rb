class WelcomeController < ApplicationController

	before_action :new_user

	layout "welcome_layout"

  def index
  	if request.xhr?
  		@schools = School.by_location(params[:lat], params[:long]).limit(10)
  		if !@schools.empty?
  			render(:partial => 'schools/partials/schools', :layout => false, :locals => {:schools => @schools})
  		else
        # byebug
  			render :json => @schools
  		end
  	else
      # byebug
  		@schools = School.paginate(:page => params[:page])
  	end
   	
  end

end
