class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :school

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}
end
