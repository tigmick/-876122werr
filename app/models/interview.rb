class Interview < ActiveRecord::Base
	belongs_to :job
  has_many :interview_schedules
  validates_inclusion_of :total_stage, :in => 1..10
end
