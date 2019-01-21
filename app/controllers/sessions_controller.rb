require 'pry'
class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def facebook_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.uid = auth['uid']
      pwd = SecureRandom.hex 
      u.password = pwd 
      u.password_confirmation = pwd
    
    end
 
    log_in(@user)

    redirect_to @user
 
  end 


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
     
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
     
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end

