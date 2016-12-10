class SessionsController < ApplicationController

  include SessionsHelper


  def new

  end

   def create


    if params[:session][:account_type] == "school"

      school = School.find_by(email: params[:session][:email].downcase)

      if school && school.authenticate(params[:session][:password])
        log_in school
        redirect_to school
        # Log the user in and redirect to the user's show page.
      else
        flash[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end

    elsif params[:session][:account_type] == "user"

      user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
        # Log the user in and redirect to the user's show page.
      else
        flash[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end
end
