class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :job_id
      t.integer :total_stage

      t.timestamps null: false
    end
  end
end
