module SessionsHelper

  def log_in(user)

    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).

  def current_user
    byebug
    
    if session[:user_id]
      if params[:controller] == "schools"
        @current_user ||= School.find_by(params[:id])
      elsif params[:controller] == "users"
        @current_user ||= User.find_by(params[:id])
      else
        @current_user = nil
      end

    end
  byebug    
  end

   # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def log_out

     session[:user_id] = nil
  end

end
