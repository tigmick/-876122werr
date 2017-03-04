class AddIsCvDownloadToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :is_cv_download, :boolean, defualt: false
  	add_column :reviews, :cv_download_date, :datetime
  end
end
