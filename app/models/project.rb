class Project < ApplicationRecord
  belongs_to :program
	has_many :classrooms
	has_many :enrollments
end
