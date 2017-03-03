class InterviewSchedulesController < ApplicationController
	def create
		@date_hash = {}
		(1..params[:date_count].to_i).each do |val|
			# instance_variable_set("@_interview_avail_date#{val}", params["interview_avail_date#{val}"])
			@date_hash["interview_avail_date#{val}"] = params["interview_avail_date#{val}"] 
		end
		interviewers_names = [] 
		interviewers_names <<  params[:interviewer_names].gsub(",",'","')
		interview = Interview.find(params[:interview_id])
		interview.interview_schedules.new(
			stage: params[:stage],
			interview_avail_dates: @date_hash,
			 interviewers_names: interviewers_names, 
			 candidate_feedback: params[:candidate_feedback], 
			 client_comment: params[:client_comment],
			 user_id:  params[:user_id]
			).save
	end
end
