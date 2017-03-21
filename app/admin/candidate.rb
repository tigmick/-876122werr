ActiveAdmin.register_page "Candidate" do
	content title: "LIST OF CANDIDATES", only: :candidate do
	render 'admin/candidates/candidate'
end

breadcrumb do
 [
   
  
 ]   
end 

controller do
	def candidate_jobs
		@candidate = User.find(params[:id])
		if @candidate.user_job.present? 
			job_ids = @candidate.user_job.job_ids 
	        @jobs = Job.where(id: job_ids)
	    else
	    	@jobs = []
	    end
	end
	def candidate_job_schedules
		@candidate = User.find(params[:candidate_id])
		job= Job.find(params[:id])
		@schedules = job.interview.interview_schedules(user_id: @candidate.id)
 
	end
end 


end