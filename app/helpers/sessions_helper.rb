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

  def must_be_school
    unless current_user.school
      redirect_to root_url      
    end
  end

  def require_individual
    unless current_user.individual
      redirect_to root_url
    end
  end

  def is_individual
    unless current_user.individual
      redirect_back_or
    end
  end

  def redirect_to_user_profile user
    # byebug
    if user.school
      redirect_to edit_school_path user.school
    else
      redirect_to edit_individual_path user.individual
    end
  end

  def redirect_back_or(default = root_url)
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end


  def log_out
     session[:user_id] = nil
  end
end
