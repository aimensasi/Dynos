class SessionsController < ApplicationController

  include SessionsHelper


  def new

  end

   def create


    school = School.find_by(email: params[:session][:email].downcase)

    if school && school.authenticate(params[:session][:password])
      log_in school
      redirect_to school
      # Log the user in and redirect to the user's show page.
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end
end
