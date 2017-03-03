class CreateInterviewSchedules < ActiveRecord::Migration
  def change
    create_table :interview_schedules do |t|
    	t.integer :interview_id
      t.integer :stage
      t.string :interview_avail_dates
      t.string :interviewers_names
      t.string :candidate_feedback
      t.string :client_comment
      t.timestamps null: false
    end
  end
end
