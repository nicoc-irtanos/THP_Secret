class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to "/secret_page", flash: {success: 'Connecté !'}
    else
      redirect_to "/login", flash: { danger: 'Mauvaise combinaison email/mot de passe. Essayez de nouveau'}
    end
  end

  def destroy
    log_out
    redirect_to root_url, flash: { success: "Déconnecté !" }
  end
end
