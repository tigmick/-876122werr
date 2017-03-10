class CreateClientComments < ActiveRecord::Migration
  def change
    create_table :client_comments do |t|
      t.integer :user_id
      t.boolean :client
      t.string :comment
      t.integer :interview_schedule_id

      t.timestamps null: false
    end
  end
end
