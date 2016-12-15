class SessionsController < ApplicationController

  include SessionsHelper


  def new

  end

   def create
    
    if session_params[:account_type] == "school"
      school = School.find_by(email: session_params[:email].downcase)

      if school && school.authenticate(session_params[:password])
        log_in school
        redirect_to school
        # Log the parent in and redirect to the parent's show page.
      else
        flash.alert = 'Invalid email/password combination' # Not quite right!
        redirect_to root_path
      end

    elsif session_params[:account_type] == "parent"
      parent = User.find_by(email: session_params[:email].downcase)
      if parent && parent.authenticate(session_params[:password])
        log_in parent
        redirect_to user_path parent
        # Log the parent in and redirect to the parent's show page.
      else
        flash.alert = 'Invalid email/password combination' # Not quite right!
        redirect_to root_path
      end
    else 
      flash.alert = "Wrong Email Or Password"
      redirect_to root_path
    end
  end

  def destroy
    
    log_out
    redirect_to root_path
  end

  private 
  def session_params
    params.require(:session).permit(:email, :password, :account_type)
  end
end
