class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :ceic
  belongs_to :classroom

	scope :not_canceled, -> {where(canceled: false )}
	scope :canceled, -> {where(canceled: true )}

end
