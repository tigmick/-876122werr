class AddMeetingToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :meeting, :text
  end
end
