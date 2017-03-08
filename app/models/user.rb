class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = ['client','candidate']

  has_many :resumes
  has_many :jobs
  has_one :user_job
  has_many :reviews

  def client?
    role == "client"
  end

  def candidate?
    role == "candidate"
  end

  def full_name
    first_name+" "+last_name
  end
  
end
