class CreateUserJobs < ActiveRecord::Migration
  def change
    create_table :user_jobs do |t|
      t.integer :user_id
      t.string :job_ids

      t.timestamps null: false
    end
  end
end
