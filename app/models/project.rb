class Project < ApplicationRecord
  belongs_to :program
	has_many :classrooms
end
