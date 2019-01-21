require 'pry'
class TipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


  def create
    tip_params[:lesson]= tip_params[:lesson].to_i    
    @tip = current_user.tips.build(tip_params)
    if @tip.save
      flash[:success] = "Thanks! Your tip has been added."
      redirect_to root_url
    else
      @feed_items = []  #This keeps failed submissions from breaking 
      render 'static_pages/home'
    end
  end

  def destroy
    @tip.destroy
    flash[:success] = "Tip deleted"
    redirect_to request.referrer || root_url #request.referrer just redirects to the previous url for a better user experience. 
  end

  private

    def tip_params
        params.require(:tip).permit(:title, :description, :link, :lesson_id)
    end

    def correct_user
      @tip = current_user.tips.find_by(id: params[:id])
      redirect_to root_url if @tip.nil?
    end
end
