class WelcomeController < ApplicationController

	before_action :new_user

	layout "welcome_layout"

  def index
   @schools= School.paginate(:page => params[:page])
  end

end
