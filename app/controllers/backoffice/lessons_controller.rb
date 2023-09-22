class Backoffice::LessonsController < ApplicationController
	layout 'admins'
	before_action :set_lesson, only: [:show, :edit, :update]

	def index
		@lessons = Lesson.find_month_lessons(params)
		#@classroom = Classroom.find(params[:classroom])
  end

	def show
	end

	private

	def lesson_params
		params.require(:lesson).permit(:date, :status, :classroom_id)
	end
	
	def set_lesson
		@lesson = Lesson.find(params[:id])
	end
end
