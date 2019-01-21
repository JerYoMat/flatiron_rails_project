class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :set_user,       only: [:show, :edit, :update, :destroy]
  def index 
    @title = "User Index"
    @users = User.paginate(page: params[:page])
      #paginate takes a hash argument with key :page and value equal to the page requested.  'params[:page]' is generated automatically by the will-paginate gem
  end 

  

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
    #debugger #uses byebug gem and provides a console in the browser
    @tips = @user.tips.paginate(page: params[:page])
  end 
  
  def edit 
    @title = "Edit User Info"
   
  end 

  def update 
 
    if @user.update_attributes(user_params)
      flash[:success] = "You changes have been saved."
      redirect_to @user
    else 
      render 'edit'
    end 
  end 


  def destroy 
    @user.destroy 
    flash[:success] = "User has been deleted."
    redirect_to users_url
  end 


  
private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

  def set_user 
    @user = User.find(params[:id])
  end 

  def correct_user
    set_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end 