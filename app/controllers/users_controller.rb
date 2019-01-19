class UsersController < ApplicationController
  def new
    @title = 'Sign Up'
  end
end
class UsersController < ApplicationController
  def show
    @title = "Profile Page"
    @user = User.find(params[:id])
    #debugger #uses byebug gem and provides a console in the browser
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
private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

end 