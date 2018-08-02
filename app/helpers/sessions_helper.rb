module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
  end
  
  def logged_in?
  end

  def log_out
  end
end
