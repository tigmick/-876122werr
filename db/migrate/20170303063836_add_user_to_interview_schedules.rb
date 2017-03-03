class AddUserToInterviewSchedules < ActiveRecord::Migration
  def change
    add_column :interview_schedules, :user_id, :integer
  end
end
