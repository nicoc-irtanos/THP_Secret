class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(email: params[:email].downcase,password_digest: params[:password])
    redirect_to("/users/" + @user.id.to_s)
  end

  def edit
  end

  def delete
  end
end
