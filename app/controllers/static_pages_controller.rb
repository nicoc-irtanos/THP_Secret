class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def secret_page
    if logged_in?
      # then stay on secret_page
    else
      # else redirection to the login page with a beautiful flash
      redirect_to "/login", flash: { flash: "hey login-toi pour y accéder" }
    end
  end
end
