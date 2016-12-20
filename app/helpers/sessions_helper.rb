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

  def owner? school
    if current_user == school.user
      return true
    else
      return nil
    end


  end

  def require_login
    unless current_user
      redirect_to sign_in_path
    end
  end

  def store_prev_page
    session[:pre_page] = request.env["HTTP_REFERER"]
  end

  def must_be_school
    unless current_user.school
      redirect_to root_url
    end
  end

  def require_individual
    # byebug
    unless current_user.individual
      redirect_to root_url
    end
  end

  def is_individual
    unless current_user.individual
      redirect_back_or
    end
  end

  def is_individual_or_new?
    if current_user
      if current_user.individual
        true
      else
        false
      end
    else
      true
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

    if session[:pre_page].present? and session[:pre_page] != request.env["REQUEST_URI"]
      redirect_to session[:pre_page]
    else
      redirect_to default
    end
    # byebug
  end

  def log_out
     session[:user_id] = nil
     session[:pre_page] = nil

  end
end
