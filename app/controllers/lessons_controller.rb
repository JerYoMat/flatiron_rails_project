require 'pry'
class LessonsController < ApplicationController

    def index 
      @lessons = Lesson.all 
    end 

    def show
      @lesson = Lesson.find(params[:id])
      @tips = Tip.where(:lesson_id => @lesson.id)
    end 
end
