class AddUserProfileIdToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :user_profile_id, :integer
  end
end
