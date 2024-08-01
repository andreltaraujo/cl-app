class RemoveUserIdFromEnrollments < ActiveRecord::Migration[7.0]
  def change
    remove_column :enrollments, :user_id, :integer
  end
end
