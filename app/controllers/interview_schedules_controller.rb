class InterviewSchedulesController < ApplicationController
	before_action :authenticate_user! 
	def create
		@date_hash = {}
		(1..params[:date_count].to_i).each do |val|
			# instance_variable_set("@_interview_avail_date#{val}", params["interview_avail_date#{val}"])
			@date_hash["interview_avail_date#{val}"] = params["interview_avail_date#{val}"] 
		end
		interview = Interview.find(params[:interview_id])
		schedule = interview.interview_schedules.new(
			stage: params[:stage],
			interview_avail_dates: @date_hash,
			 interviewers_names: params[:interviewer_names].split(","), 
			 candidate_feedback: params[:candidate_feedback], 
			 client_comment: params[:client_comment],
			 user_id:  params[:user_id]
			)
		 schedule.save
     flash[:notice] = schedule.errors.messages  unless schedule.present?
		 redirect_to "/users/#{params[:user_id]}/user_profile?job_id=#{interview.job.id}&review=true"
	end

	def show
		@job = Job.find(params[:id])
		@schedules = @job.interview.interview_schedules.where(user_id: current_user.id) if current_user.candidate?
		@schedules = @job.interview.interview_schedules.where(user_id: params[:user_id]) if current_user.client?

	end

	def candidate_feedback
		schedule = InterviewSchedule.find(params[:schedule_id])
    schedule.update(candidate_feedback: params[:candidate_feedback])
	  redirect_to interview_schedule_path(schedule.interview.job)
	end

	def client_comment
		schedule = InterviewSchedule.find(params[:schedule_id])
    schedule.update(client_comment: params[:client_comment])
    redirect_to "/interview_schedules/#{schedule.interview.job.id}?user_id=#{schedule.use_id}"
	end

	def next_step
		schedule = InterviewSchedule.find(params[:sched_id])
    schedule.update(next_step: params[:next_step], next_step_desc: params[:next_step_desc])
    flash[:notice] = schedule.errors.messages 
    redirect_to "/interview_schedules/#{schedule.interview.job.id}?user_id=#{schedule.user_id}"
	end
end
