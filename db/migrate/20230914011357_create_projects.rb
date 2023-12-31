class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.belongs_to :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
