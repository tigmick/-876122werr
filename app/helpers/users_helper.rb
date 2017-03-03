module UsersHelper
	def reviewed_by(reviews,job)
		review = reviews.find_by(job_id: job.id, user_id: current_user)
		if review.present?
			client_name = User.find(review.user_id).full_name 
			return client_name
	  end
	end
	def interviewed_by(job)
		if job.interview.present?
			interviewers = job.interview.interview_schedules.where(user_id: current_user).map(&:interviewers_names)
	  	return interviewers
	  end
	end
end
