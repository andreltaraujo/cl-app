class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :school
	has_one :address
	has_many :phone_numbers
	has_many :enrollments
	has_many :attendances

	accepts_nested_attributes_for :user, :address, :phone_numbers, :enrollments, reject_if: :all_blank

	validates :first_name, :last_name, :birthdate, presence: true

	scope :active, -> {where(active: true)}
	scope :inactive, -> {where(active: false)}

	def full_name
		[self.first_name, self.last_name].join(' ')
	end

	def self.search(params)
		query = all
		if params[:active].present?
			query = query.where(active: true)
		elsif params[:inactive].present?
			query = query.where(active: false)
		end

		if params[:search].present?
			query = query.where("first_name ILIKE ?", "%#{sanitize_sql_like(params[:search])}%")
		end

		query
	end
end
