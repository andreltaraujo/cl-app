class Attendance < ApplicationRecord
  belongs_to :user_profile
  belongs_to :lesson

	# Scope for filtering attendances by month and project
  scope :attended_in_month, ->(start_date, end_date, project_ids) do
    joins(lesson: { classroom: :project }).where(attended: true, lessons: { date: start_date..end_date }, classrooms: { projects: { id: project_ids } })
  end

	def self.find_lessons_attendances(lessons)
		where(lesson_id: lessons)
	end
end
