module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    # if a temporary already exist
    if (user_id = session[:user_id])
      # 
      @current_user ||= User.find_by(id: user_id)
    # else verify if a cookie exist 
    elsif (user_id = cookies.signed[:user_id])
      # get the user from the id
      user = User.find_by(id: user_id)
      # verify if the user exist and its cookie tokken match with the db
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end

  end

  def remember(user)
    # go to user model for more help
    # create a new cookie token and affect it to the user
    user.remember
    # asign the user.id to the cookie
    cookies.permanent.signed[:user_id] = user.id
    # asign the user's cookie token to the actuel cookie
    cookies.permanent[:remember_token] = user.remember_token
  end

  def logged_in?
    !current_user.nil?
  end
  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Forgets a persistent session.
  def forget(user)
    # delete user's cookie token from the db
    user.forget
    # delete the cookie
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
