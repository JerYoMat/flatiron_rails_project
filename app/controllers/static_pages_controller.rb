class StaticPagesController < ApplicationController
  def home 
    @title = "LearnHELP"
    if logged_in?
      @options = @options = Lesson.all.map{|l| [l.name, l.id]}
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
