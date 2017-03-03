class Job < ActiveRecord::Base
  belongs_to :industry
  belongs_to :user
  has_many :reviews

  has_one :interview
  has_many :interview_schedules, through: :interview

  include PgSearch
  multisearchable :against => [:title]
end
