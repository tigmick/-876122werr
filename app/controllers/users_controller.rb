class UsersController < ApplicationController
  def dashboard
    if current_user.client?
      @user = current_user
      @applied_jobs = []
    else
      @user = current_user
      @applied_jobs = Job.where(id: current_user.user_job.job_ids) if current_user.user_job.present? 
    end
  end
end
