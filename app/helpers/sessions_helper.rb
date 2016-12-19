module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    session[:user_id]
  end

  def new_user
    if logged_in?
      redirect_to schools_path
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def owner school
    return nil unless current_user == school.user
  end

  def require_login
    unless current_user
      session[:pre_page] = request.env["HTTP_REFERER"]
      redirect_to sign_in_path
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
    if session[:pre_page].present?
      redirect_to session[:pre_page]
    elsif request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end

  def log_out
     session[:user_id] = nil
     session[:pre_page] = nil
  end
end
