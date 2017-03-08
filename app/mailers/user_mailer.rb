class UserMailer < ApplicationMailer
  def resume_download candidate,job_id
  	@job = Job.find(job_id)
  	@client_email  = User.find(@job.user_id).email
  	@candidate_eamil = User.find(candidate).email
  	@subject = "CV Download"
  	mail(from: @client_email,to: @candidate_eamil, subject: @subject)
  end 
  def review_mail candidate,job_id
  	@job = Job.find(job_id)
  	@client_email  = User.find(@job.user_id).email
  	@candidate_eamil = User.find(candidate).email
  	@subject = "profile reviews"
  	mail(from: @client_email,to: @candidate_eamil, subject: @subject)
  end 
end
