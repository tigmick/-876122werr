class CreateCandidateFeedbacks < ActiveRecord::Migration
  def change
    create_table :candidate_feedbacks do |t|
      t.integer :user_id
      t.string :feedback
      t.boolean :client
      t.integer :interview_schedule_id

      t.timestamps null: false
    end
  end
end
