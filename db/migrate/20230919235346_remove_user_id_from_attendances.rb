class RemoveUserIdFromAttendances < ActiveRecord::Migration[7.0]
  def change
    remove_column :attendances, :user_id, :integer
  end
end
