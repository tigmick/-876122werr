class ClientComment < ActiveRecord::Base
	belongs_to :interview_schedule
	belongs_to :user
end
