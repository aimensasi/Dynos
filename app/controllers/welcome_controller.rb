class WelcomeController < ApplicationController

	before_action :new_user

	layout "welcome_layout"

  def index
   @schools= School.paginate(:page => params[:page], :per_page => 30)
  end

end
