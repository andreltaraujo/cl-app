class Backoffice::LessonsController < ApplicationController
	layout 'admins'
	before_action :set_lesson, only: [:show, :edit, :update]

	def index
		@classrooms = Classroom.all
		@lessons = Lesson.page(params[:page]).search(params)
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
