class UserJob < ActiveRecord::Base
	belongs_to :user
	serialize :job_ids, Array
end
