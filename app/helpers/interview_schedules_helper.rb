module InterviewSchedulesHelper
	def client_comment_helper schedule
    html = ""
		unless schedule.client_comments.empty?
		  schedule.client_comments.each do |comment|
		   html += "<b>#{comment.user.first_name}</b> : #{comment.comment} <button onclick='show(#{schedule.id},#{comment.id},\"#{comment.comment}\")' class='btn btn-primary' id='myBtn'>edit</button>#{link_to 'delete',destroy_comment_path(comment),method: :delete}</br>"
		  end	
			html += "<button onclick='show(#{schedule.id},\"\",\"\")' class='btn btn-primary' id='myBtn'>Add comment</button>"
		 else
		   html += "<button onclick='show(#{schedule.id},\"\",\"\")' class='btn btn-primary' id='myBtn'>Add comment</button>"
		 end
		html.html_safe
		end


	def candidate_feedback_helper schedule
	html = ""
    unless schedule.candidate_feedbacks.empty?
      schedule.candidate_feedbacks.each do |feedback|
       html += "<b>#{feedback.user.first_name}</b> : #{feedback.feedback} <button onclick='feedback(#{schedule.id},#{feedback.id},\"#{feedback.feedback}\")' class='btn btn-primary' id='myBtn'>edit</button>#{link_to 'delete',destroy_feedback_path(feedback),method: :delete}<br>"
      end	
      html += "</br><button onclick='feedback(#{schedule.id},\"\",\"\")' class='btn btn-primary' id='myBtn'>Add feedback</button>"
    else
      html += "<button onclick='feedback(#{schedule.id},\"\",\"\")' class='btn btn-primary' id='myBtn'>Add feedback</button>"
    end 
    html.html_safe
	end


	def next_step_helper schedule
		html = ""
		html += "Next Step: #{schedule.next_step}<br>" if schedule.next_step.present?
		html += "Description: #{schedule.next_step_desc}<br>" if schedule.next_step_desc.present?
		if current_user.client?
			
			unless schedule.stage.zero?
       html += "<button onclick='next_step(#{schedule.id},\"#{schedule.stage}\",\"#{schedule.interviewers_names.join('","')}\",\"#{schedule.client_comment_id}\")' class='btn btn-primary' id='myBtn'>Edit</button>"
       if schedule.stage.eql?(@last_stage)
       html += "<button onclick='next_step(\"\",\"#{schedule.stage+1}\",\"\",\"\")' class='btn btn-primary' id='myBtn'>Add</button>  "
       end
       html += link_to "delete", "/interview_schedules/#{schedule.id}", method: :delete 
      else
       html += "<button onclick='next_step(\"\",\"#{schedule.stage+1}\",\"\",\"\")' class='btn btn-primary' id='myBtn'>Add</button>"
      end
		end
		html.html_safe
	end
end
