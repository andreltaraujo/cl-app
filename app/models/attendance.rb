class Attendance < ApplicationRecord
  belongs_to :user_profile
  belongs_to :lesson

	def user_profile_attendances
	end

	def self.find_lessons_attendances(lessons)
		where(lesson_id: lessons)
	end
end
