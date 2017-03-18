class AddDefaultValueToReview < ActiveRecord::Migration
  def up
  change_column :reviews, :is_cv_download, :boolean, :default => false
end

def down
  change_column :reviews, :is_cv_download, :boolean, :default => nil
end
end
