class Backoffice::AnalyticsController < ApplicationController
  before_action :authenticate_admin!
	layout 'analytics'
	
	def index
		@user_profiles = UserProfile.all
		@enrollments = Enrollment.all
		@projects = Project.all
		@total_attended_count = total_attended_count(@projects)
		@total_open_lessons_count = total_open_lessons_count(@projects)
	end

	def total_attended_count(projects)
		Attendance.joins(lesson: { classroom: :project }).where(attended: true, classrooms: { projects: { id: projects.pluck(:id) } }).count
	end

	def total_open_lessons_count(projects)
		Lesson.joins(classroom: :project).where(status: 'open', classrooms: { project_id: @projects.pluck(:id) }).count
	end

	def attendances_in_month()
		Attendance.attended_in_month(start_date, end_date, project_ids).count
	end

	def open_lessons_in_month()
		Lesson.open_in_month(start_date, end_date, project_ids).count
	end

	def users_reports
		@user_profiles = UserProfile.all
	end

	def enrollments_reports
	end

	def projects_reports
		@projects = Project.all
	end

	def project_report
		@project = Project.find(params[:id])
	end
end
