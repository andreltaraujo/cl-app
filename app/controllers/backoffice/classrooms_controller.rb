class Backoffice::ClassroomsController < ApplicationController
	layout 'admins'
	before_action :set_classroom, only: [:show, :edit, :update]

	def index
		@classrooms = Classroom.find_classrooms(params)
  end

	def show
		@classroom_month_lessons = Lesson.find_month_lessons(classroom_params)
		@attendance = Attendance.new
	end

	private

	def classroom_params
		params.permit(:id, :month, :schedule, :active, :project_id, :ceic_id)
	end
	
	def set_classroom
		@classroom = Classroom.find(params[:id])
	end
end
