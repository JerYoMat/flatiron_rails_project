class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]


  def new 
    @title = "Sign Up"
    @user = User.new 
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "Welcome, a user was successfully created!"
      redirect_to @user 
    else
      render 'new' 
    end 
  end 

  def show
    @title = "Profile Page"
    set_user
    #debugger #uses byebug gem and provides a console in the browser
  end 
  
  def edit 
    @title = "Edit User Info"
    set_user
  end 

  def update 
    set_user
    if @user.update_attributes(user_params)
      flash[:success] = "You changes have been saved."
      redirect_to @user
    else 
      render 'edit'
    end 
  end 


private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

  def set_user 
    @user = User.find(params[:id])
  end 

  def logged_in_user
    unless logged_in?
      store_location 
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    set_user
    redirect_to(root_url) unless current_user?(@user)
  end

end 