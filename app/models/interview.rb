class Interview < ActiveRecord::Base
	belongs_to :job
  has_many :interview_schedules
end
