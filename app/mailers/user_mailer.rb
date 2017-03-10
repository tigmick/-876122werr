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

  def client_comment comment ,user_id
    @client_email  = current_user.email
    @candidate_eamil = comment.user.email
    @subject = "#{comment.comment}"
    mail(from: @client_email,to: @candidate_eamil, subject: @subject)
  end

  def candidate_feedback feedback,client_id
    @client_email  = User.find(client_id).email
    @candidate_eamil = feedback.user.email
    @subject = "#{feedback.feedback}"
    [@candidate_eamil,"tigmicheal@yahoo.co.uk"].each do |mail_to|
      mail(from: @client_email,to: mail_to, subject: @subject)
    end
  end
end
