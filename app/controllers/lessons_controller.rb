class LessonsController < ApplicationController

	def index
		@title = "Lessons overview"
		@lessons = Lesson.all
	end

	def show
		@lesson = Lesson.find(params[:id])
		@title = @lesson.title
	end
end
