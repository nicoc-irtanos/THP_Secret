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
      redirect_to "/login"
    end
  end
end
