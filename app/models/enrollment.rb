class Enrollment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :project
  belongs_to :ceic
  belongs_to :classroom

	scope :active, -> {where(canceled: false )}
	scope :canceled, -> {where(canceled: true )}

	scope :patrimonio, -> {where(ceic_id: 1)}
	scope :laranjeiras, -> {where(ceic_id: 2)}
	scope :ponta_negra, -> {where(ceic_id: 3)}

	scope :active_patrimonio, -> {where(ceic_id: 1, canceled: false)}
	scope :active_laranjeiras, -> {where(ceic_id: 2, canceled: false)}
	scope :active_ponta_negra, -> {where(ceic_id: 3, canceled: false)}

	scope :canceled_patrimonio, -> {where(ceic_id: 1, canceled: true)}
	scope :canceled_laranjeiras, -> {where(ceic_id: 2, canceled: true)}
	scope :canceled_ponta_negra, -> {where(ceic_id: 3, canceled: true)}


end
