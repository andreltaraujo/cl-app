class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.datetime :date
      t.string :status, default: 'open'
      t.belongs_to :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
