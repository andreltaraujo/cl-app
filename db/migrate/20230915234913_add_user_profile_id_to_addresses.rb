class AddUserProfileIdToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :user_profile_id, :integer
  end
end
