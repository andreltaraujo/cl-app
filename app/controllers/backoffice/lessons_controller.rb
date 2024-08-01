class Backoffice::LessonsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_lesson, only: [:show, :edit, :update]
	before_action :set_projects, only: :new
	layout 'admins'

	CURRENT_YEAR = Date.current.year

	def index
		@classrooms = Classroom.all
		@lessons = Lesson.page(params[:page]).search(params)
  end

	def show
	end

	def new
		@lesson = Lesson.new
		@months_available = @lesson.new_lessons_months_allowed
	end

	def create
		year = CURRENT_YEAR
		month = Date::MONTHNAMES.index(params[:month])
		project = Project.find(params[:project_id])
		weekdays = params[:weekdays][:weekdays].reject(&:empty?)
		matching_dates = {}
		weekdays.each do |weekday|
			start_date = Date.new(year, month, 1)
			end_date = Date.new(year, month, -1)

			matching_dates_for_weekdays = []

			current_date = start_date
			while current_date <= end_date
				if weekdays.include?(current_date.wday.to_s)
					matching_dates_for_weekdays << current_date
				end
					current_date += 1
					matching_dates = matching_dates_for_weekdays
			end
		end
		matching_dates.each do |date|
			classroom_ids = project.classrooms.ids
			classrooms = Classroom.find(classroom_ids)
			classrooms.each do |classroom|
				if lesson = Lesson.create!(
					date: date,
					classroom: classroom
					)
					classroom.enrollments.each do |enrollment|
						Attendance.create!(
							lesson: lesson,
							user_profile_id: enrollment.user_profile_id
						)
					end
					flash[:success] = "Aulas adicionadas com sucesso!"
				else
					flash[:danger] = "Não foi possível adicionar as aulas!"
					render :new
				end
			end
		end
	end

	private

	def lesson_params
		params.require(:lesson).permit(:date, :status, :classroom_id)
	end
	
	def set_lesson
		@lesson = Lesson.find(params[:id])
	end

	def set_projects
		@projects = Project.all
	end

	def weekdays_collection
    [
      ['Monday', 1],
      ['Tuesday', 2],
      ['Wednesday', 3],
      ['Thursday', 4],
      ['Friday', 5]
    ]
  end
	helper_method :weekdays_collection
end
