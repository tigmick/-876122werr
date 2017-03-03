class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :job_id
      t.integer :user_id
      t.boolean :is_review , defualt: false
      t.integer :review_count

      t.timestamps null: false
    end
  end
end
