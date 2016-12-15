class WelcomeController < ApplicationController

	layout "welcome_layout"
	
  def index
   @schools= School.all
  end

end
