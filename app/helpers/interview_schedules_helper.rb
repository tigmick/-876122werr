module InterviewSchedulesHelper
	def client_comment_helper schedule

		html = ""
		html += "#{schedule.client_comment} <br>"
		if current_user.client?
			if schedule.client_comment.present?
       html += "<button onclick='show(#{schedule.id},\"#{schedule.client_comment}\")' class='btn btn-primary' id='myBtn'>Edit comments</button>"
      else
       html += "<button onclick='show(#{schedule.id},\"\")' class='btn btn-primary' id='myBtn'>Add comments</button>"
      end
		end
		html.html_safe
	end


	def candidate_feedback_helper schedule
		html = ""
		html += "#{schedule.try(:candidate_feedback)} <br>"
    unless current_user.client?
      if schedule.candidate_feedback.present?
      	html += "<button onclick='show(#{schedule.id},\"#{schedule.candidate_feedback}\")' class='btn btn-primary' id='myBtn'>Edit feedback</button>"
      else
      	html += "<button onclick='show(#{schedule.id},\"\")' class='btn btn-primary' id='myBtn'>Add feedback</button>"
      end
    end
    html.html_safe
	end


	def next_step_helper schedule
		html = ""
		html += "Next Step: #{schedule.next_step}<br>" if schedule.next_step.present?
		html += "Description: #{schedule.next_step_desc}<br>" if schedule.next_step_desc.present?
		if current_user.client?
			
			unless schedule.stage.zero?
       html += "<button onclick='next_step(#{schedule.id},\"#{schedule.stage}\",\"#{schedule.interviewers_names.join('","')}\",\"#{schedule.client_comment}\")' class='btn btn-primary' id='myBtn'>Edit</button>   "
       html += "<button onclick='next_step(\"\",\"\",\"\",\"\")' class='btn btn-primary' id='myBtn'>Add</button>  "
       html += link_to "delete", "/interview_schedules/#{schedule.id}", method: :delete 
      else
       html += "<button onclick='next_step(\"\",\"\",\"\",\"\")' class='btn btn-primary' id='myBtn'>Add</button>"
      end
		end
		html.html_safe
	end
end
