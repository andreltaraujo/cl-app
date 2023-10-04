class Attendance < ApplicationRecord
  belongs_to :user_profile
  belongs_to :lesson

	# Scope for filtering attendances by month and project
	scope :attended_in_month_by_project, ->(start_date, end_date, project_ids) {
		joins(lesson: { classroom: :project }).where(attended: true, lessons: { date: start_date..end_date }, projects: { id: project_ids })
	}

	# Scope for filtering attendances by month
	scope :attended_by_month, ->(start_date, end_date){joins(:lesson).where(attended: true, lessons: { date: start_date..end_date })}

	# Scope for filtering attendances by project
	scope :attended_by_project, ->(project_ids){joins(lesson: { classroom: :project }).where(attended: true, projects: { id: project_ids })}

	# Scope for filtering attendances by lesson
	scope :attended_by_lesson, ->(lesson_ids){where(attended: true, lesson_id: lesson_ids)}

	# Scope for filtering attendances by user
	scope :attended_by_user, ->(user_profile_ids){where(attended: true, user_profile_id: user_profile_ids)}

	# Scope for filtering attendances by classroom
	scope :attended_by_classroom, ->(classroom_ids){joins(:lesson).where(attended: true, lessons: { classroom_id: classroom_ids })}

	# Scope for filtering attendances by ceic
	scope :attended_by_ceic, ->(ceic_ids){joins(:lesson).where(attended: true, lessons: { ceic_id: ceic_ids })}

	def self.find_lessons_attendances(lessons)
		where(lesson_id: lessons)
	end
end
