class Review < ActiveRecord::Base
	belongs_to :job
	belongs_to :user
	serialize :cv_ids, Array
end
