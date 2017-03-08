class AddCvIdsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :cv_ids, :string
  end
end
