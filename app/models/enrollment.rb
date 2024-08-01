class Enrollment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :project
  belongs_to :ceic
  belongs_to :classroom

	scope :active, -> {where(canceled: false )}
	scope :canceled, -> {where(canceled: true )}

	scope :active_by_project, ->(project_id) {active.where(project_id: project_id)}
	scope :active_by_ceic, ->(ceic_id) {active.where(ceic_id: ceic_id)}

	scope :active_by_gender, ->(gender) {active.includes(:user_profile).where(user_profiles: { genre: gender }) }

	scope :patrimonio, -> {where(ceic_id: 1)}
	scope :laranjeiras, -> {where(ceic_id: 2)}
	scope :ponta_negra, -> {where(ceic_id: 3)}

	scope :active_patrimonio, -> {active.where(ceic_id: 1)}
	scope :active_laranjeiras, -> {active.where(ceic_id: 2)}
	scope :active_ponta_negra, -> {active.where(ceic_id: 3)}

	scope :canceled_patrimonio, -> {canceled.where(ceic_id: 1)}
	scope :canceled_laranjeiras, -> {canceled.where(ceic_id: 2)}
	scope :canceled_ponta_negra, -> {canceled.where(ceic_id: 3)}
end
