class SearchEnginsController < ApplicationController
  
  def search_school
  	@schools = School.filters(params)
  	if request.xhr?
  		# byebug
  		#accessed by ajax request
  	  render(:partial => 'schools/partials/schools', :layout => false, :locals => {:schools => @schools})
  	else
  		# accessed by html request
  		render :template => "schools/index"
  	end

  end

  def search_event
  	@events = Event.by_address(params)
  	render "create"
  end

  private
  def school_params
  	params.require(:search_engins).permit(:location, :max_age, :min_age, :category, :query)
  end

  def event_params
  	params.require(:search_engins).permit(:location)
  end
end
