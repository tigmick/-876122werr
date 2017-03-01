class UsersController < ApplicationController
  def dashboard
    if current_user.client?
      @user = current_user
      @applied_jobs = []
    else
      @user = current_user
      @applied_jobs = current_user.user_job.present? ? Job.where(id: current_user.user_job.job_ids) : [] 
    end
  end
end
