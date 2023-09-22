class Lesson < ApplicationRecord
  belongs_to :classroom
	has_many :attendances
	validates :date, :classroom, presence: true

	def self.find_month_lessons(params)
		month = Date::MONTHNAMES.index(params[:month]) unless params[:month].blank?
		params[:month].present?	? where("EXTRACT(MONTH FROM date) = ?", month).where(classroom_id: params[:id]) : current_lessons(params[:id])
	end

	def self.current_lessons(classroom)
		where("EXTRACT(MONTH FROM date) = ?", Date.current.month).where(classroom_id: classroom)
	end
end
