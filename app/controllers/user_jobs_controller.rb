class UserJobsController < ApplicationController
	before_action :authenticate_user! 
	def create
		@job_id = params[:job_id]
		if current_user.user_job.nil? || current_user.user_job.job_ids.empty?
			user_job = current_user.build_user_job(job_ids: [@job_id.to_i])
			user_job.save
		else
			job_ids = current_user.user_job.job_ids.push(@job_id.to_i)
			current_user.user_job.update(job_ids: job_ids)
		end
    respond_to do |format|
    	format.js
    end
	end
end
