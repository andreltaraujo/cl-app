class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zipcode
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
