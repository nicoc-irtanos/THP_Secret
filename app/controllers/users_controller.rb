class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    if email.invalid?
      :danger "Un email doit au format valide doit être renseigné et ne peut pas faire plus de 255 caractères !"
      render 'new'
    elsif password.invalid?
      :danger "Le mot de passe est obligatoire et doit contenir au moins 6 caractères"
      render 'new'
    elsif password != password_confirmation
      :danger "Le mot de passe et la confirmation sont différents"
      render 'new'
    else
    @user = User.create!(email: params[:email].downcase,password_digest: params[:password])
    redirect_to("/users/" + @user.id.to_s), success: "Profil utilisateur créé"
  end

  def edit
  end

  def delete
  end
end
