class AddNextStepToInterviewSchedules < ActiveRecord::Migration
  def change
    add_column :interview_schedules, :next_step, :integer
    add_column :interview_schedules, :next_step_desc, :string
  end
end
