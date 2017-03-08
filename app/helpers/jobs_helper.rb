module JobsHelper
	def feedbacks(schedules)
  html = ""
	html += "<h3>candidates feedback</h3>"
   	schedules.each do |schedule|
   		user_id = schedule.user_id
   		if schedule.candidate_feedback.present?
			html += "<b>"+User.find(schedule.user_id).first_name+"</b><br>" if current_user.client? || current_user.id.eql?(schedule.user_id)
			html += "<b>Unknown</b><br>" unless current_user.client? || current_user.id.eql?(schedule.user_id)
			html += "<b>"+schedule.stage.ordinalize+"</b> round :"+schedule.candidate_feedback+"</br>"
		  end
		end
		return html.html_safe
	end
end
