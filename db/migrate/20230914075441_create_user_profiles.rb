class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :genre
      t.string :father_name
      t.string :mother_name
      t.boolean :active
      t.belongs_to :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
