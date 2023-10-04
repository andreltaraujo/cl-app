class Backoffice::ClassroomsController < ApplicationController
	layout 'admins'
	before_action :set_classroom, only: [:show, :update]
	before_action :set_projects_and_ceics, only: :index

	def index
		@classrooms = Classroom.page(params[:page]).find_classrooms(params)
  end

	def show
		@classroom_month_lessons = @classroom.month_lessons(classroom_params)
		@attendances = @classroom.lessons_attendances(@classroom_month_lessons)
		@user_profiles = @classroom.user_profile_attendances(@attendances)
	end

	def find_classroom_users
		enroll = Enrollment.where(classroom_id: params[:id])
	end

	private

	def classroom_params
		params.permit(:id, :month, :schedule, :active, :project_id, :ceic_id)
	end
	
	def set_classroom
		@classroom = Classroom.find(params[:id])
	end

	def set_projects_and_ceics
		@projects = Project.all
		@ceics = Ceic.all
	end
end
