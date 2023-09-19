class Classroom < ApplicationRecord
  belongs_to :project
  belongs_to :ceic

	scope :first_group, -> {where(project_id: 1, ceic_id: 1)}

	def self.find_classrooms(params)
		@classrooms = params[:project_id] && params[:ceic_id].blank? ? all : where(project_id: params[:project_id], ceic_id: params[:ceic_id])
		@schedules = @classrooms.map { |r| [r.id, r.schedule.strftime('%H:%M')] }
	end

	def self.sanitize_schedules(group)
		group.each do |g|
			g.sanitize_schedule
		end
	end
end
