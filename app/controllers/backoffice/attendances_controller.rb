class Backoffice::AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update]
	
	def index
		@attendances = Attendance.all
  end

	def show
	end

	def new
		@attendance = Attendance.new
	end

	def create
		@attendance = Attendance.new(attendance_params)
		if @attendance.save!
			flash[:notice] = "Frequência Registrada"
		else
			redirect_to backoffice_classrooms_path, status: :unprocessable_entity
		end
	end

	def edit
		@attendance = Attendance.find(params)
	end

	def update
		if @attendance.update(attendance_params)
			flash[:notice] = "Frequência Atualizada"
	end

	private

	def set_attendance
		@attendance = Attendance.find(params)
	end

	def attendance_params
		params.require(:attendance).permit(:attended, :lesson_id, :user_profile_id)
	end
end
