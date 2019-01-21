class StaticPagesController < ApplicationController
  def home 
    @title = "Home"
    if logged_in?
      @lessons = Lesson.all 
      @tip  = current_user.tips.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end 

  def help 
    @title = "Help"
      
  end

  def about 
    @title = "About"
  end 

end
