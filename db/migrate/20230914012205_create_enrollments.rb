class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.boolean :canceled
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :ceic, null: false, foreign_key: true
      t.belongs_to :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
