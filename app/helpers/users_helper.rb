module UsersHelper
	def reviewed_by(reviews,job)
		html = ""
		review = reviews.find_by(job_id: job.id, user_id: current_user)
		html = review.present? ? "<b>Yes</b> on <b>Date: #{review.created_at}</b>" : "<b>No</b>"
	  return html.html_safe
	end
	def interviewed_by(job)
		html = ""
		if job.interview.present? && !job.interview.interview_schedules.empty?
			interview_dates = job.interview.interview_schedules.where(user_id: current_user).map(&:interview_avail_dates).flatten
	    # interview_dates = interview_dates.collect{|k| k.values}.flatten.join(', ')
	  	html =  "<b>Yes</b><br> on"
	  	interview_dates.each do |interview|
	  		html += "<b> #{interview.values.join(', ')} </b><br>"
	  	end
	  else
	  	html = "<b>No</b>"
	  end
	    return html.html_safe
	end

	def interview_status(job)
		if job.interview.present?
			html = ""
			stages = job.interview.interview_schedules.where(user_id: current_user).map(&:stage).flatten
	  	stages.each do |stage|
        html += "<b>"+stage.ordinalize+"</b> round<br>"
	  	end
       html += link_to "show schedule","/interview_schedules/#{job.id}?user_id=#{current_user.id}"
	  	# html += link_to "show schedule",interview_schedule_path(job)
	  	return html.html_safe
	  end
	end
end
