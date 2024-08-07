class Backoffice::AnalyticsController < ApplicationController
  before_action :authenticate_admin!
	layout 'analytics'
	
	def index
		users_reports
		enrollments_reports
		projects_reports
		total_attended
		total_open_lessons
	end

	def total_attended
		@total_attended = Attendance.where(attended: true).count
	end

	def total_open_lessons
		@total_open_lessons = Lesson.where(status: 'open').count
	end

	def attendances_in_month()
		Attendance.attended_in_month(start_date, end_date, project_ids).count
	end

	def open_lessons_in_month()
		Lesson.open_in_month(start_date, end_date, project_ids).count
	end

	def users_reports
		@user_profiles = UserProfile.all.count
		@active_user_profiles = UserProfile.active.count
		@inactive_user_profiles = UserProfile.inactive.count
	end

	def enrollments_reports
		@enrollments = Enrollment.all.count
		@active_enrollments = Enrollment.active.count
		@canceled_enrollments = Enrollment.canceled.count
	end

	def projects_reports
		@projects = Project.all
		@project_attendance_counts = Attendance.attendance_counts_by_project(@projects)
	end

	def project_report
		@project = Project.find(params[:id])
		@project_attendance_counts = Attendance.attended_by_project(@project).count
		@project_lesson_counts = Lesson.open_by_project(@project.id).count
		@project_active_enrollment_counts = @project.enrollments.active.count
		@project_canceled_enrollment_counts = @project.enrollments.canceled.count
	end
end
