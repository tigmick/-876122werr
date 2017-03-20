ActiveAdmin.register_page "Candidate" do
  content title: "Candidate", only: :candidate do
    render 'admin/candidates/candidate'
  end

  controller do
		def candidate_jobs
			@candidate = User.find(params[:id])
			job_ids = @candidate.user_job.job_ids
      @jobs = Job.where(id: job_ids)  
		end
		def candidate_job_schedules
			@candidate = User.find(params[:candidate_id])
			job= Job.find(params[:id])
			@schedules = job.interview.interview_schedules(user_id: @candidate.id)
     
		end
  end 


end