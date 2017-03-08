class InterviewSchedule < ActiveRecord::Base
	serialize :interview_avail_dates, Hash
	serialize :interviewers_names, Array
	validates_inclusion_of :stage, :in => 1..10
	validates_inclusion_of :next_step, :in => 1..10 ,:allow_nil => true
	# has_many :interviews
 #  has_many :jobs, through: :interviews
   belongs_to :interview
end
