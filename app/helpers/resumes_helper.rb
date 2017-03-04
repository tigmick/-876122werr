module ResumesHelper
	def resume_links resume
		html = ""
		unless current_user.client?
			html += "<td> #{link_to 'Show', resume }</td>"
			html += "<td> #{link_to 'Edit', edit_resume_path(resume) }</td>"
		  html += "<td>#{link_to 'Destroy', resume, method: :delete, data: { confirm: 'Are you sure?' }}</td>"
		else
		  html += "<td> #{link_to 'Download ('+resume.cv_file_name+')', {:controller => 'resumes', :action => 'download', :id => resume.id, job_id: @job.id},  target: '_blank'} </td>"
    end
    html.html_safe
  end
end
