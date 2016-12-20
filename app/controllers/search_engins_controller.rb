class SearchEnginsController < ApplicationController
  
  def search_school
    # byebug
  	@schools = School.filters(params).paginate(:page => params[:page])
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

  	@events = Event.by_address(params).paginate(:page => params[:page])
    # byebug
    if request.xhr?
      # byebug
      #accessed by ajax request
      render(:partial => 'events/partials/events', :layout => false, :locals => {:events => @events})
    else
      # accessed by html request
      render :template => "events/index"
    end
  end

  private
  def school_params
  	params.require(:search_engins).permit(:location, :max_age, :min_age, :category, :query)
  end

  def event_params
  	params.require(:search_engins).permit(:location)
  end
end
