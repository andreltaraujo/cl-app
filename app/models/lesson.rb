class Lesson < ApplicationRecord
  belongs_to :classroom
	has_many :attendances
	validates :date, :classroom, presence: true

	validates_uniqueness_of :date, scope: :classroom_id
  validate :unique_lesson_per_date

	# Scope for filtering lessons by status, month, and project
	scope :open_in_month, ->(start_date, end_date, project_ids) {
		joins(classroom: :project).where(status: 'open', date: start_date..end_date, projects: { id: project_ids } )
	}

	scope :open_by_project, ->(project_id) { joins(classroom: :project).where(status: 'open', projects: { id: project_id }) }

	scope :classroom_lessons, ->(classroom_id) { where(classroom_id: classroom_id) }

	def self.search(params)
		query = all
		if params[:classroom_id].present?
			query = query.classroom_lessons(params[:classroom_id])
		end
		query
	end

	def self.find_month_lessons(params)
		month = Date::MONTHNAMES.index(params[:month]) unless params[:month].blank?
		params[:month].present?	? where("EXTRACT(MONTH FROM date) = ?", month).where(classroom_id: params[:id]) : current_lessons(params[:id])
	end

	def self.current_lessons(classroom)
		where("EXTRACT(MONTH FROM date) = ?", Date.current.month).where(classroom_id: classroom)
	end

	def new_lessons_months_allowed
		Date::MONTHNAMES.compact.select.with_index(1) { |mes, index| index >= Date.current.month }
	end

	private

	def unique_lesson_per_date
    if classroom && date.present? && classroom.lessons.where(date: date).exists?
      errors.add(:date, 'already has a lesson for this classroom')
    end
  end
end
