class InterviewSchedulesController < ApplicationController
	def create
		@date_hash = {}
		(1..params[:date_count].to_i).each do |val|
			# instance_variable_set("@_interview_avail_date#{val}", params["interview_avail_date#{val}"])
			@date_hash["interview_avail_date#{val}"] = params["interview_avail_date#{val}"] 
		end
		interview = Interview.find(params[:interview_id])
		interview.interview_schedules.new(
			stage: params[:stage],
			interview_avail_dates: @date_hash,
			 interviewers_names: params[:interviewer_names].split(","), 
			 candidate_feedback: params[:candidate_feedback], 
			 client_comment: params[:client_comment],
			 user_id:  params[:user_id]
			).save

		redirect_to "/users/#{params[:user_id]}/user_profile?job_id=#{interview.job.id}&review=true"
	end

	def show
		@job = Job.find(params[:id])
		@schedules = @job.interview.interview_schedules.where(user_id: params[:user_id])
	end
end
