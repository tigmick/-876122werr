class InterviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_job
  def new
  end 

	def create
		if @job.interview.present?
			job = @job.interview.update(inteview_params)
		else
  		job = @job.build_interview(inteview_params).save
    end
    flash[:notice] =  "stage should be between 1 to 10" unless job.present?
  	redirect_to job_path(@job)
	end

	def set_job
		@job = Job.find params[:job_id]
	end

	private

	def inteview_params
		params.require(:interview).permit(:total_stage)
	end
end
