class StaticPagesController < ApplicationController
  def home 
    @title = "learnHELP"
    if logged_in?
      @options = Lesson.all.map{|l| [l.name, l.id]}  
      @tip  = current_user.tips.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end 

end
