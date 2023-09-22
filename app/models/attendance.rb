class Attendance < ApplicationRecord
  belongs_to :user_profile
  belongs_to :lesson
end
