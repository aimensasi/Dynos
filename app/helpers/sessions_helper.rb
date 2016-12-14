module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def require_login
    unless current_user
      redirect_to root_url
    end
  end

  def log_out
     session[:user_id] = nil
  end
end
