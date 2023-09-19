class RemoveUserIdFromPhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    remove_column :phone_numbers, :user_id, :integer
  end
end
