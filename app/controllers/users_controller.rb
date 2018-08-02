class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create!(email: params[:email].downcase, password: params[:password])
    redirect_to("/users/" + user.id.to_s)
    flash.now[:success] = "Profil utilisateur créé"
    log_in user
  end

  def edit
    user = current_user
    if user == nil
      redirect_to login_path
    elsif user.id == params[:id].to_i
    else
      redirect_to login_path
    end
  end

  def delete
  end
end
