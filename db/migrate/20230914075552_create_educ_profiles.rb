class CreateEducProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :educ_profiles do |t|
      t.string :name
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :ceic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
