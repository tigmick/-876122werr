class RemoveFieldFromInterviewSchedules < ActiveRecord::Migration
  def change
  	remove_column :interview_schedules, :candidate_feedback
  	remove_column :interview_schedules, :client_comment
  end
end
