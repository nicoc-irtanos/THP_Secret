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
    else
      redirect_to "/login", flash: { flash: "hey login-toi pour y accéder" }
    end
  end
end
