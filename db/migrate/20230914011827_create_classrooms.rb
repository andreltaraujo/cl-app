class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.time :schedule
      t.boolean :active
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :ceic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
