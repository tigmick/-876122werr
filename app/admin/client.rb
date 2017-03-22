ActiveAdmin.register_page "Client" do
	
  content title: "LIST OF CLIENTS", only: :client do
    render 'admin/clients/client'
  end

  breadcrumb do
 [
   # link_to('Admin', admin_root_path),
 ]   
end 

controller do
	def client_jobs

		@client = User.find(params[:id])

		@jobs =  @client.jobs
	end

	def client_job_schedules
		debugger
		@candidate = User.find(params[:client_id])
		job= Job.find(params[:id])
		@schedules = job.interview.interview_schedules(user_id: @candidate.id)
	end
end 
end