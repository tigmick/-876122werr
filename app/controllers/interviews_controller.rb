class InterviewsController < ApplicationController
	before_action :set_job
  def new
  end 

	def create
		debugger
		if @job.interview.present?
			@job.interview.update(inteview_params)
		else
  		@job.build_interview(inteview_params).save
    end
  	redirect_to job_path(@job)
	end

	def set_job
		@job = Job.find params[:job_id]
	end

	def inteview_params
		params.require(:interview).permit(:total_stage)
	end
end
