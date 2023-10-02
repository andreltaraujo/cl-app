class AddUserProfileIdToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_column :enrollments, :user_profile_id, :integer
  end
end
