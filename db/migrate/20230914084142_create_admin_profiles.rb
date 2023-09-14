class CreateAdminProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_profiles do |t|
      t.string :name
      t.string :role
      t.boolean :active
      t.belongs_to :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
