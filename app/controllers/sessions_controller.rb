class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to("/secret_page")
    else
      flash.now[:danger] = 'Mauvaise combinaison email/mot de passe. Essayez de nouveau'
      render 'new'
    end
  end

  def destroy
    success: "Déconnecté !"
  end
end
