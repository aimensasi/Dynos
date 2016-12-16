class SearchEnginsController < ApplicationController
  
  def search_school
  	@schools = School.filters(school_params)
  	render "create"
  end

  def search_event
  	@events = Event.by_address(event_params)
  	render "create"
  end

  private
  def school_params
  	params.require(:search_engins).permit(:location, :max_age, :min_age, :category)
  end

  def event_params
  	params.require(:search_engins).permit(:location)
  end
end
